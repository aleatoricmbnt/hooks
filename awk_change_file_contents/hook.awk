#!/usr/bin/awk -f

# Replace "foo" with "bar" in the file provided as argument
{
    gsub(/foo/, "bar")
    print
}
