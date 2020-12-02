#!/usr/bin/env julia

function main_2_1()
    policies = open("day-2.txt") do f
        [l for l in eachline(f)]
    end

    num_valid = 0
    for policy in policies
    
        low, high, letter, password = parse_policy(policy)
        
        valid = 0
        if password[low] == letter
            valid += 1
        end

        if password[high] == letter
            valid += 1
        end

        num_valid += valid == 1 ? 1 : 0

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