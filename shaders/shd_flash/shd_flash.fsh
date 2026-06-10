//
//	Flashing fragment shader from this video: https://www.youtube.com/watch?v=g7uhXXUgeAM
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

// Allows us to change things outside of this shader
uniform float _red;
uniform float _green;
uniform float _blue;
uniform float _alpha; // aka Transparency

void main()
{
	vec4 Color = texture2D( gm_BaseTexture, v_vTexcoord );
	
	if (Color.a != 0.0)
	{
		gl_FragColor = vec4(_red, _green, _blue, _alpha);
	}
}
