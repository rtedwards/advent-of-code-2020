#!/usr/bin/env julia

function main_6()
    ans = read("day-6.txt", String)
    groups = split(ans, "\n\n")

    total, every = 0, 0
    for group in groups
        peeps = split(group, "\n")        
        hist = Dict()
        for person in peeps
            for l in person
                hist[l] = get!(hist, l, 0) + 1
            end
        end
        l = filter(x -> x .== length(peeps), collect(values(hist)))
        total += sum(length(keys(hist)))
        every += length(l)
    end

    println("$total unique answers, $every questions answered by everyone")
end

main_6()