#!/usr/bin/env julia

function main_6()
    ans = read("day-6.txt", String)
    groups = split(ans, "\n\n")

    total_answers = 0
    everyone_answered = 0
    for group in groups
        peeps = split(group, "\n")
        n_peeps = length(peeps)
        
        hist = Dict()
        for person in peeps
            for l in person
                hist[l] = get!(hist, l, 0) + 1
            end
        end
        a = values(hist)
        l = collect(a)[a .== n_peeps]
        everyone_answered += length(l)
        total_answers += sum(length(keys(hist)))
    end

    println("There are $total_answers unique answers")
    println("Everyone_answered $everyone_answered questions")
end

main_6()