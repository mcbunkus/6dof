function controls = getControls(t, ipl, params, controls, vI)

    controls.delta_a = 0;
    controls.delta_r = 0;
    
    if t < 20
        controls.delta_e = controls.delta_e0;
    else if t >= 20 
        controls.delta_e = -1 * pi / 180;
    end

end