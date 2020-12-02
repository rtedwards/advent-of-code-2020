#!/usr/bin/env julia

function main_1_1()
    expenses = open("day-1.txt") do f
        [parse(Int, l) for l in eachline(f)]
    end
    
    sort!(expenses)

    num1, num2, answer = find_sum_2(expenses)
    println("$num1 + $num2 = $answer")
    return answer
end

function find_sum_2(expenses)
	n = length(expenses)
	for i in 1:n
		for j in n:-1:1
			expense_sum = expenses[i] + expenses[j]
			if expense_sum == 2020
				return (expenses[i], expenses[j], expenses[i] * expenses[j]) 
			end
		end
	end
end

main_1_1()