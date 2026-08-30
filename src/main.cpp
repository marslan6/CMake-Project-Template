#include <print>

int main (int argc, char** argv)
{
    std::println("Hello World!"); 
    std::println("{}", argc);
    std::println("{}", argv[0]);

    if (argc >= 1)
    {
        std::println("Argv is {}", argv[0]);
    }

    return 0;
}