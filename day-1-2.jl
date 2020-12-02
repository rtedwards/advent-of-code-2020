#!/usr/bin/env julia

function main_1_2()
    expenses = open("day-1.txt") do f
        [parse(Int, l) for l in eachline(f)]
    end
    
    sort!(expenses)

    num1, num2, num3, answer = find_sum_3(expenses)
    println("$num1 + $num2 + $num3 = $answer")
    return answer
end

function find_sum_3(expenses)
	n = length(expenses)
	for i in 1:n
        for j in n:-1:1
            for k in i:j
                expense_sum = expenses[i] + expenses[j] + expenses[k]
                if expense_sum == 2020
                    return (expenses[i], expenses[j], expenses[k], expenses[i] * expenses[j] * expenses[k]) 
                end
			end
		end
	end
end

main_1_2()