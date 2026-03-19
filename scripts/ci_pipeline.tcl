###########################################################
# CI Pipeline for Vivado
###########################################################
cd C:VIT_INTERN/Runner_demo/spi_controller_sv/
set log_file "C:/VIT_INTERN/Runner_demo/spi_controller_sv/ci_error_log.txt"

if {[file exists $log_file]} { file delete -force $log_file }
set fp [open $log_file "w"]

###########################################################
# Clean build folder
###########################################################
if {[file exists ./builds]} { file delete -force ./builds }

###########################################################
# Create project
###########################################################
puts "Creating project..."
create_project adder ./builds -part xc7z010clg400-1

###########################################################
# Add RTL sources
###########################################################
set rtl_files [glob -nocomplain ./src/*.v]
if {[llength $rtl_files] == 0} {
    puts $fp "ERROR: No RTL files found"
    puts "No RTL files found"
} else {
    add_files $rtl_files
}

###########################################################
# Add TB sources
###########################################################
set sim_files [glob -nocomplain ./tb/*.v]
if {[llength $sim_files] == 0} {
    puts $fp "ERROR: No TB files found"
    puts "No TB files found"
} else {
    add_files -fileset sim_1 -norecurse $sim_files
}

###########################################################
# Add constraints
###########################################################
set xdc_files [glob -nocomplain ./constr/*.xdc]
if {[llength $xdc_files] == 0} {
    puts $fp "ERROR: No constraint files found"
    puts "No constraint files found"
} else {
    add_files -fileset constrs_1 $xdc_files
}

update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

###########################################################
# ---------------- SIMULATION ----------------------------
###########################################################
puts "Starting simulation..."

set sim_ok 1

if {[catch {exec xvlog {*}$rtl_files} msg]} {
    puts "xvlog RTL FAILED:\n$msg"
    puts $fp "ERROR: xvlog RTL failed"
    set sim_ok 0
} else {
    puts "xvlog RTL OK"
}

if {$sim_ok && [catch {exec xvlog {*}$sim_files} msg]} {
    puts "xvlog TB FAILED:\n$msg"
    puts $fp "ERROR: xvlog TB failed"
    set sim_ok 0
} else {
    puts "xvlog TB OK"
}

if {$sim_ok && [catch {exec xelab tb_ha -s tb} msg]} {
    puts "xelab FAILED:\n$msg"
    puts $fp "ERROR: xelab failed"
    set sim_ok 0
} else {
    puts "xelab OK"
}

if {$sim_ok && [catch {exec xsim tb -runall} msg]} {
    puts "xsim FAILED:\n$msg"
    puts $fp "ERROR: xsim failed"
    set sim_ok 0
} else {
    puts "Simulation completed successfully"
}


###########################################################
# ---------------- SYNTHESIS -----------------------------
###########################################################
puts "Starting synthesis..."
if {[catch {
    launch_runs synth_1 -jobs 4
    wait_on_run synth_1
} msg]} {
    puts $fp "ERROR: Synthesis failed"
    puts "Synthesis failed: $msg"
} else {
    set synth_status [get_property STATUS [get_runs synth_1]]
    puts "Synthesis status: $synth_status"
    if {[string match "*ERROR*" $synth_status]} {
        puts $fp "ERROR: Synthesis failed"
    }
}

###########################################################
# ---------------- IMPLEMENTATION ------------------------
###########################################################
puts "Starting implementation..."
if {[catch {
    launch_runs impl_1 -jobs 4
    wait_on_run impl_1
} msg]} {
    puts $fp "ERROR: Implementation failed"
    puts "Implementation failed: $msg"
} else {
    set impl_status [get_property STATUS [get_runs impl_1]]
    puts "Implementation status: $impl_status"
    if {[string match "*ERROR*" $impl_status]} {
        puts $fp "ERROR: Implementation failed"
    }
}

###########################################################
# ---------------- BITSTREAM -----------------------------
###########################################################
puts "Generating bitstream..."
if {[catch {
    launch_runs impl_1 -to_step write_bitstream
    wait_on_run impl_1
} msg]} {
    puts $fp "ERROR: Bitstream generation failed"
    puts "Bitstream generation failed: $msg"
} else {
    puts "Bitstream generated successfully"
}

###########################################################
# ---------------- FINAL CHECK ---------------------------
###########################################################
close $fp
set log_content [read [open $log_file r]]
if {[string match "*ERROR*" $log_content]} {
    puts "CI BUILD FAILED. Check $log_file for details."
} else {
    puts "CI BUILD SUCCESSFUL"
}
