#include <print>

int main (int argc, char** argv)
{
    std::println("Hello World!"); 
    std::println("{}", argc);
    std::println("{}", argv[0]);

    if (argc >= 1)
    {
        std::println("Mehmet ARSLAN lives in {}", argv[1]);
    }

    return 0;
}