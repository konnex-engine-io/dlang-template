import std.stdio : readf, writefln;

string sayHello(string input) 
{
    name = "World";
    readf!" %s"(input);

    if (input != "") {
        name = input;
    }

    writefln("Hello, " ~ name ~ "!\n\n
    This is a simple function written in the D Programming Language using STDIO with of-watchdog in streaming mode.\n
    This simple function has been compiled in an Alpine 3.13 Docker image into a statically-linked executable binary.\n
    The binary has been containerized in a FROM scratch image for deployment to OpenFaaS.\n");
}
