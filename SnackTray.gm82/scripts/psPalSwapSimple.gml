return shader_pixel_create_base64("
    eJytls9uW0UUh78Z/7uxY48dO3bspMXLsomUICSyaCxSJIpUJKCN6C4EakikVIkS
    I3XB4njPoo/gdbPJA7DgAVjwBmwi1jwBRjP3+DJxLRbUiyud33fP/Obcc+fOXGOn
    07+nn/Lo2ccHW8CfgLHTaR7wGgN/AGdALkjLT54DPwdmMBSZKLsBLHkMa/yi7LfA
    ChjaGTv64eXRwfHV8Nnw1ejHyyF5VoOTie5/cXw2HI2ylOu3ci7ShM8+4XpWSXZv
    dD46PlOHr09fjE64uDraPfqWz0+/uzy/Ov9+1H/w1fv9x0+ePuk/PTl+MbzsPzp/
    eXF6Nrzs723v7m3vfbi7/cHOzg7XX0IBnH/EAfAQfn0I/X3PTcqBb/bh9T7cBG4z
    /vs+/LUPycDzXMY3BvBgAB8FXsz44wE8H8BJ4KWMywBe+fl5z7cTBHI3Gr8mcZNZ
    bBI3OQivywnc3pDcTgxYQyLAxELOYMQwlTxMiuGelQJMCpCz4d6hGPBMcw/DWO9j
    qXnfEOcwYsHn2hxWLG9CnI94PvBpiAsYP2eITeRTDHOkvIgVoz6liJcCT30SjJSU
    F6iJUZ8kilcwvv6QsxKeL/UsR7wceOpZwUhZ+SpGkiy2kujYasSrgadjaxipKq9Q
    E6s11KLYYaSiOQ4rFfWsR7weeOrZwEhd+RpGallspaZjmxFvBp6ObWGkqbxBTXJa
    QyuK1zHS0Jx1rDTUsx3xduCpZwcjbeUbGGllsZWWju1GvBt4OraHka7yDjUpag29
    KN7ESEdzNrHSUc+tiG8Fnnrew8gWiF/rOZx/LjHJbVj7Fuf7nuk8TvKRNji/TjJd
    wkkp0kWcryvTBZwUIp3gJIl0GSflSK/gZCXSVZxUI72Kk9VIV3BSiXQNJ7VI13FS
    j7TDiYt0EyfNSK/hZC3SDZw0It3CSSvSbZy0I72Ok/VId3HSjfQGTjYi3cFJJ9L3
    cdKL9BZOtiK9iZNN1el+FPYq/07Ghfj9cCvPIa96XIJJicPJSrYvzecw9u/de1ld
    Bz4uqe9sXVgdo/qOr9//ZjlW14L3KKrHbG0U1UP1nIe9k+NrsxyOwxq9wxiHdTlX
    b/I/6419Cwt8q+/Qh5x6rKrH7JvLqYfqt/oQ58z6EL6NuXrLC+qtLaEPlQW+zSX0
    YW0JfQjf8Fy99QX1tpbQh8YC3+4S+rCxhD6EvWau3vaCeu8voQ9hnwqX/5cx0tOz
    xdfW0zOnF+L0nMlFOfewUuKN/vuk8ex86f3H+ePPj3uRjs8rq+P98+X1+fJ6XvnL
    1676zvP5f6xZTtwj34d37VHYmyOWh3HYv3Uu/bcM79fPNdP+8mNU35kLzIKcf/cp
    31OS1Gc6hX8Aiktllg==
")

/*
    // Fragment Shader
    varying vec2 v_vTexcoord;
    varying vec4 v_vColour;

    //uniform sampler2D gm_BaseTexture;
    uniform sampler2D gm_PaletteTexture;
    uniform float paletteID;
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

            // Check if the base color matches the palette color
            if (baseColor == paletteColor) {
                // Calculate the UV coordinates for the replacement color in the selected palette column
                paletteUV.x = (paletteID + 0.5) / totalPaletteWidth;

                // Sample the replacement color
                outputColor = texture2D(gm_PaletteTexture, paletteUV);
            }
        }

        gl_FragColor = outputColor;
    }
*/
