import std.stdio : readf, writefln;

int main(string[] args)
{
    string input, name;

    readf!" %s"(input);

    if (input != "") {
        name = input;
    }
    else
    {
        name = "Bugy's World";
    }

    writefln("Hello, " ~ name ~ "!\n\n
    This is a simple function written in the D Programming Language using STDIO and streaming mode.\n
    This simple function has been compiled into a statically-linked, system-native, executable binary.\n
    The binary has been containerized in a FROM scratch image and deployed to OpenFaaS.\n
    The OpenFaas Functionality layer is running on Kubernetes...\n");

    return 0;
}
