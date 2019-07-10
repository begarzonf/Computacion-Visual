in vec3 objColor;

out vec3 finalColor;

uniform vec3 lightColor;

void main() {
   float ambientStrength = 0.3f;
   vec3 ambient = lightColor * ambientStrength;
   finalColor = ambient * objColor;
}