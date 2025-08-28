return shader_pixel_create_base64("
    eJytV81OG1cU/u6d8Xj8e/EPxjaGWl1UyQYJ0lZlEaxAF6mUSmmTKNm5buIWKhAI
    XInl4Q3yCF6HDQ/QRR+giz5AlzwAT9Cpzpnj0cWgSom8GPl83z3znZ/7NzY2Sf5N
    9rH38sluD8BvBjA2SWIAjGGAtwb4A0Ag0OIv5gH8I5yBQYQb5djfogCDL1A2KdUT
    LoRBPeMeCpeDQSvjvhYugkE34/aEy8NgPeOeCxfD4POMG/56NNwdnY1fjs8nv5+O
    EaIsmemwjD8fHY4nk8zl8o7P0ej8yeHJ/giXl7PKsrGT9OXvvh1u+mDLB4988CWG
    k+PJ6FCjvj54N9nHydlwa/gzvj94e3p8dvzLpP/gx4f9p89ePOu/2B+9G5/2946P
    Tg4Ox6f97Y2t7Y3tr7Y2Hm1ubuLyByAHuCmAAYDHwJ+Pgf4O80b4bwbATzvA+x3g
    Sngr/PlgxgF/Cx+kOmAM3OwA8YD5YsbHA6A9AB4IX8r4lONYzJcz/ukAeDMA9oWv
    ZDxpTjc7n/GUAQQEV2q/R+ymM9vEbrorS8wRcH2F+HrK02xQZSy2RUwAphYILAxZ
    JBQC00jGLMXANAcERsZekQWI3wtg+FdtSwYfxA49PhQ+ETsHw7piRxqfdSPV5Rx4
    LA9DkfrlYSlS3djjY+FT3QIM56gxLFXwQXQKqJLBtdRlEEpdOa2lqDFnORdRJav9
    KMFQQfVKsFRQn7LHl4VP41dgqKx8FYaKmW2pqO86j3fCp+8uwZBTvoIqBZrDktSR
    iF2DoYr61NL6xK57fD31F7sBQ3WA/Lojrbs5V3cTVSpqzGUYaqreMiw11afl8S3h
    0zgrMNRSvoEqlVSnDUMN5duw1FCdjsd3hE91ujDUUX5F1ku6Fme55zV3O5e7RZXK
    GrPr2avil+qtwpJV/57H94RP46/BUA8g3icBHM8Bmfha9o2B4zWU4RCOQg9HcBR5
    OIaj2MN5OMp7OAdHOQ8X4Kjg4SIcz0eGy3BcV4ZLcNznDDs4ch6uwlHVwxU4qnh4
    CY6WPFyHo7qHa3BU83ATjpoebsFRy8PLcLTs4QYcNTzcgaOOh9tw1PbwChyteNjC
    8T7M8DocdT3cg6Oeh1fhaFUxr5kIeT5XeE4u0rMlL/PDzxsgVHxRAaYVvJrGMsfx
    LR+DPJ9ZFzzvrOXrxp+o62vkP0LD3pObRXIha3QuX1mXGivQWAWNxZjfCfQdxXfy
    9X1murl7dMufqOtrlD5Cw96TG/dB9spcvrL+52JVFtAHd49ufQF9qC2gD7Kn5/KV
    fTsXq7GAPizfo9tZQB/aC+iDnE1z+cr5MhdrfQF9kHNKHr6LDHX1buFvpq7eOV2x
    k+x7aeazJvdP+r0TqD27X7r/cx7y/bHmYf++4vpCrS/U+hjzuRBq7mGK79Q380m/
    AVMNqxqMOQd+WEPxLY0A8S0f7lGA5ELO5rm+yfmtsaCxuOdpLP4WTfg7S+782Tg/
    rKH4Tv6+D+fnn1vp35q0j0kC/AeutJrF
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
    uniform float maxAlpha;

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
            }
        }
        outputColor.a = baseColor.a*maxAlpha;
        gl_FragColor = outputColor;
    }
*/
