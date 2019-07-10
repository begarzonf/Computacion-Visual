uniform mat4 modelview;
uniform mat4 transform;
uniform mat3 normalMatrix;
uniform vec4 lightPosition[8];

attribute vec4 position;
attribute vec4 color;
attribute vec3 normal;


varying vec3 lightDirection[8]; 
varying vec4 vertColor;
varying vec3 cameraDirection;
varying vec3 lightDirectionReflected[8];
varying vec3 ecNormal;

void main() {
  gl_Position = transform * position;    
  vec3 ecPosition = vec3(modelview * position);  
  vec3 ecNormal = normalize(normalMatrix * normal);
	cameraDirection = normalize(0 - ecPosition);
	
	for(int i=0;i<2;i++){
		lightDirection[i] = normalize(lightPosition[i].xyz - ecPosition);
		vec3 lightDirection = normalize(lightPosition[i].xyz - ecPosition);
		lightDirectionReflected[i] = reflect(-lightDirection, ecNormal);
	}
  vertColor = color;
}
