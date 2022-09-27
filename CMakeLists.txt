cmake_minimum_required(VERSION 3.17)

project(vulkan-validation-build)

# Disable some nuisence warnings
add_compile_options(
	"/wd4100" # unreferenced formal parameter
	"/wd4505" # unreferenced static function was removed
	"/wd4389" # signed/unsigned mismatch
	"/wd4245" # conversion from int to uint32_t
	"/wd4458" # local declaration hides class member
	"/wd4457" # declaration hides function parameter
	"/wd4459" # declaration hides global
	"/wd4127" # conditional expression is constant
	"/wd4706" # assignment within conditional expression
	"/wd4702" # unreachable code
	"/wd4189" # local variable initialized but not referenced
	"/wd4754" # (??? what) Conversion rules for arithmetic operations in the comparison at ... mean that one branch cannot be executed.
)

message("Setting up vulkan headers...")
add_subdirectory("Vulkan-Headers")

message("Setting up glslang...")
add_subdirectory("glslang")

message("Setting up spirv headers...")
add_subdirectory("SPIRV-Headers")

message("Setting up spirv-tools...")
add_subdirectory("SPIRV-Tools")

message("Setting up vulkan validation layers...")
add_subdirectory("Vulkan-ValidationLayers")
# Add reference since validationlayers CMakeLists.txt is bad
target_link_libraries(VkLayer_utils PUBLIC SPIRV-Headers)
