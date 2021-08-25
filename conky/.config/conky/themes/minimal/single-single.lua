--[[
Author:             Arturo Aguilar Lagunas
Description:        Dark theme for a single monitor
]]

conky.config = {
    -- General
    alignment = 'top_right',
    background = false,
    border_width = 1,
    cpu_avg_samples = 2,
    default_color = 'white',
    default_outline_color = 'white',
    default_shade_color = 'white',
    double_buffer = true,               -- Removes flickering
    draw_borders = false,               -- Borders (text)
    draw_graph_borders = true,          -- Borders (graphs)
    draw_outline = false,               -- Border (window)
    draw_shades = false,                -- Shades
    extra_newline = false,              -- Extra newline at the end when writing to stdout
    font = 'RobotoMono Nerd Font:size=12',
    gap_x = 0,
    gap_y = 0,
    minimum_height = 0,
    minimum_width = 0,
    net_avg_samples = 4,
    no_buffers = true,
    out_to_console = false,
    out_to_ncurses = false,
    out_to_stderr = false,
    out_to_x = true,
    own_window = true,
    own_window_class = 'Conky',
    own_window_type = 'desktop',
    own_window_argb_visual = true,
    own_window_argb_value = 195,
    show_graph_range = false,
    show_graph_scale = false,
    stippled_borders = 0,
    update_interval = 2.0,
    uppercase = false,
    use_spacer = 'none',
    use_xft = true,
}

conky.text = [[
${color} System ${stippled_hr}
${color grey}OS:        $sysname $nodename $machine
${color grey}Kernel:    $kernel
${color grey}Uptime:    $uptime

${color}File system ${stippled_hr}
${color grey}root:  ${fs_used /}/${fs_size /} ${alignr} ${fs_used_perc /}% ${fs_bar 6, 124 /}

${color}Processes: $processes  Running: $running_processes ${stippled_hr}
${color grey}Name                 PID    CPU    MEM
${color grey}${top name 1} ${top pid 1} ${top cpu 1} ${top mem 1}
${color grey}${top name 2} ${top pid 2} ${top cpu 2} ${top mem 2}
${color grey}${top name 3} ${top pid 3} ${top cpu 3} ${top mem 3}
${color grey}${top name 4} ${top pid 4} ${top cpu 4} ${top mem 4}
${color grey}${top name 5} ${top pid 5} ${top cpu 5} ${top mem 5}
${color grey}${top name 6} ${top pid 6} ${top cpu 6} ${top mem 6}
${color grey}${top name 7} ${top pid 7} ${top cpu 7} ${top mem 7}
${color grey}${top name 8} ${top pid 8} ${top cpu 8} ${top mem 8}
${color grey}${top name 10} ${top pid 10} ${top cpu 10} ${top mem 10}

${color}Memory ${stippled_hr}
${color grey}RAM:  $mem/$memmax ${alignr}$memperc% ${membar 4, 124}
${color grey}Swap: $swap/$swapmax ${alignr}$swapperc% ${swapbar 4, 124}

${color}CPU ${stippled_hr}
${color grey}  0: ${freq_g 1}GHz ${alignr}${cpu cpu0}% ${cpubar cpu0 4, 124}
${color grey}  1: ${freq_g 2}GHz ${alignr}${cpu cpu1}% ${cpubar cpu1 4, 124}
${color grey}  2: ${freq_g 3}GHz ${alignr}${cpu cpu2}% ${cpubar cpu2 4, 124}
${color grey}  3: ${freq_g 4}GHz ${alignr}${cpu cpu3}% ${cpubar cpu3 4, 124}
${color grey} Av: ${freq_g}GHz ${alignr}${cpu}% ${cpubar 4, 124}
${cpugraph 30}

${color}Networking: ${stippled_hr}
SSID: ${wireless_essid wlan0} ${alignr}${wireless_bitrate wlan0} 
Speed Up:   ${upspeed wlan0} ${alignr}Speed Down:   ${downspeed wlan0}
Total Up:   ${totalup wlan0} ${alignr}Total Down:   ${totaldown wlan0}
${upspeedgraph wlan0 30, 254} ${alignr}${downspeedgraph wlan0 30, 254}
]]
-- ${alignr}${wireless_link_qual_perc wlan0}% ${wireless_link_bar 4,124 wlan0}