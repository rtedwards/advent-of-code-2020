#!/usr/bin/env julia

function main_2_1()
    policies = open("day-2.txt") do f
        [l for l in eachline(f)]
    end

    num_valid = 0
    for policy in policies
    
        low, high, letter, password = parse_policy(policy)
        letter_counts = get_counts(password)

        if low <= get(letter_counts, letter, 0) <= high
            num_valid += 1
        end
    end

    println("There are $num_valid valid policies")
    return num_valid
end


function parse_policy(policy)
	policy_list = split(policy, "-")
	
	low = parse(Int, policy_list[1])
	
	policy_list = split(string(policy_list[2]), ":")
	
	high = parse(Int, split(policy_list[1], " ")[1])
    letter = string(split(policy_list[1], " ")[2])
    letter = letter[1]
	
    # Having to convert from SubString to String is disgusting...
    pass = string(policy_list[2][2:end])

    return (low, high, letter, pass)
end

function get_counts(password)
    counts = Dict()
    for letter in password
		if get(counts, letter, 0) == 0
			counts[letter] = 1
		else
			counts[letter] += 1
		end
    end
    
    return counts
end

main_2_1()    