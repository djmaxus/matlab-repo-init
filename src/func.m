function output = func(value,n)
arguments (Input)
    value       double
    n     (1,1) int32
end
    output = value.^double(n);
end
