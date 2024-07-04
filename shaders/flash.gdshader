shader_type canvas_item;
uniform vec4 flash_color : source_color = vec4(1.0);
uniform float flash_strength : hint_range(0.0, 1.0) = 0.0;

void fragment() {
	vec4 color = texture(TEXTURE, UV);
	color.rgb = mix(color.rgb, flash_color.rgb, flash_strength);
	if (flash_strength > 0.0) {
		COLOR = color;
	}
}
