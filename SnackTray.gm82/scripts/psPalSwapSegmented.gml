//shader uniforms
return shader_pixel_create_base64("
    eJytV01vG1UUPe/N2DN2xn6J7Ti24waLBSqbSElAIovGIkWoSK0EtFW7M4EaEilV
    osRIXd78g/4EL1GzyZIlS5b8AJZZsugPQAy6d65HLxML0cqLke85c9+5H+9rbGya
    /pMe4P6Tz/f7AB4ZwNg0jQAwhgG+NMAvAAKBFr8yD+B34QwMyvhTub8AWIQwaOBv
    5RLDXAkG7ZzrCleGQS/nPhIugsFGzu0IF8Pgw5wb/fRytH9wPn4yfjX5+WyMEIlk
    Ybz3Xx8cjyeT3OXyls9p5vDVF6MtXF5eziqZ837bBzs++ASjycnk4FiDPTt6MTnE
    6floe/Q9Hh39cHZyfvLjZHD3248HDx4+fjh4fHjwYnw2uH/y8vToeHw22N3c3t3c
    /XR7c2dri5P4BigBbgpgCOAe8Ns9YLDHvBH+syHw3R7weg+4Et4K/2o444A/hA8y
    HTAG3u4B8ZD5Ss7HQ6AzBO4KX835jONYzC/l/IMh8HwIHAqf5DxpTm/3PuCpAggI
    rtR+jdhNZ7aJ3XRflpEj4PoK8fWUp9egzlhsi5gATC0QWBiySCkEpmV5ZykGpiUg
    MPLuKVmAeFwAw79qWzJ4I3bo8aHwqdglGNYVu6zxWbesupwDv4tgqKx+ESyVVTf2
    +Fj4TLcCwzlqDEsJ3ohOBXUyuJa6DEKpq6S1VDXmLOcq6mS1H0swVFG9JViqqE/i
    8YnwWfwaDCXK12GomtuWqjrWebwTPhu7DENO+RrqFGgOy1JHKvYKDNXUZwWWaqrZ
    8PiG8JlmE4YaAPl1l7XuVqHuFupU0ZirMNRSvVVYaqlP2+Pbwmdx1mCorXwTdaqq
    TgeGmsp3YKmpOl2P7wqf6fRgqKv8mqyXbC3Oco80d1vI3aJOSxqz59nr4pfprcOS
    Vf++x/eFz+LfgaE+QLxPAjieAzLxtewbA8drKMchHIUeLsNR2cMxHMUejuAo8nAJ
    jkoersBx/3NcheM+5jiBo8TDS3BcZ44dHDkP1+Go7uEaHNU8vAxHyx5uwFHDwytw
    tOLhFhy1PNyGo7aHV+Fo1cNNOGp6uAtHXQ934Kjj4TU4WvOwheN9mOMNOOp5uA9H
    fQ+vw9G6Yl4zZUR8rvCcXGRnSyTzw89zIFR8kQDTBE+nscxxfMPHIOIz64LnnbV8
    3fg9dX2N6B007JzcLNILWaOFfGVdaqxAY1U0FmMeE+gYxbfy9X1muqU5usl76voa
    S++gYefkxn2QvVLIV9Z/IVZtAX1wc3QbC+jDygL6IHu6kK/s20Ks5gL6sDpHt7uA
    PnQW0Ac5mwr5yvlSiLWxgD7IOSUP30WGenq38DdTT++cnthp/r0087kj90/2vROo
    Pbtfev9xHvL9ccfD/n3F9YVaX6j1hYjkvuKHc1d8q76ZT/YNmGlY1WDMOfDDGopv
    aASIb/hwjwKkF3I2F/om53chFvf8/8bifH0fFM6p7O+LfO9SmgL/Anr+mew=
")

/*
    // Fragment Shader
    varying vec2 v_vTexcoord;
    varying vec4 v_vColour;

    //uniform sampler2D gm_BaseTexture;
    uniform sampler2D gm_PaletteTexture;
    uniform float paletteID_1;
    uniform float paletteID_2;
    uniform float paletteID_3;
    uniform float paletteID_4;
    uniform float totalPaletteWidth;

    void main() {
        // Sample the base texture
        vec4 baseColor = texture2D(gm_BaseTexture, v_vTexcoord);
        // Initialize the output color to the base color
        vec4 outputColor = baseColor;



        // Loop through the palette colors in the first column
        for (int i = 0; i < 16; i++) {
            // Calculate the UV coordinates for the current color in the first column
            vec2 paletteUV = vec2(0.5 / totalPaletteWidth, (float(i) + 0.5) / float(16));

            // Sample the color from the first column
            vec4 paletteColor = texture2D(gm_PaletteTexture, paletteUV);

            // Modify the Palette's Color so it's alpha always matches the baseColor.
            paletteColor.a = baseColor.a;

            // Check if the base color matches the palette color
            if (baseColor == paletteColor) {
                // Calculate the UV coordinates for the replacement color in the selected palette column
                if (i<4) paletteUV.x = (paletteID_1 + 0.5) / totalPaletteWidth;
                else if (i<8) paletteUV.x = (paletteID_2 + 0.5) / totalPaletteWidth;
                else if (i<12) paletteUV.x = (paletteID_3 + 0.5) / totalPaletteWidth;
                else  paletteUV.x = (paletteID_4 + 0.5) / totalPaletteWidth;

                // Sample the replacement color
                outputColor = texture2D(gm_PaletteTexture, paletteUV);
                outputColor.a = baseColor.a;
            }
        }

        gl_FragColor = outputColor;
    }
*/
