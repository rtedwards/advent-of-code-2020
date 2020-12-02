### A Pluto.jl notebook ###
# v0.12.14

using Markdown
using InteractiveUtils

# ╔═╡ 4f1a363a-34a5-11eb-3600-89c48ff142d0
begin
	using Pkg
	Pkg.activate(mktempdir())
end

# ╔═╡ 1b0ea912-34a9-11eb-2eb1-9558e4ae1546
begin
	include("day-1-1.jl")
	include("day-1-2.jl")
	# include("day-2-1.jl")
	# include("day-2-2.jl")
	
	Pkg.add([
			"BenchmarkTools",
			"PlutoUI"
			])
	using BenchmarkTools
	
	import PlutoUI
end

# ╔═╡ 2f333ba6-34a9-11eb-25f5-91d4f926e801
@benchmark main_1_1()

# ╔═╡ 6ad68fe8-34ac-11eb-0988-27194a21b1a8
@benchmark main_1_2()

# ╔═╡ 038ae156-34af-11eb-1870-5db986ea3f90
begin
	policy = "18-19 v: ksssrwzjnwjnjxzdqwk"
	policy_list = split(policy, "-")
	
	low = policy_list[1]
	
	policy_list = split(policy_list[2], ":")
	
	high = split(policy_list[1], " ")[1]
	letter = split(policy_list[1], " ")[2]
	
	pass = policy_list[2][2:end]
end

# ╔═╡ 03719124-34af-11eb-1239-4fa857b9783a
d = Dict()

# ╔═╡ f627acc8-34af-11eb-1730-dd3b6f936f27
get(d, "a", 0)

# ╔═╡ 03ad7c00-34b1-11eb-32c5-9dc94a3f4fa3
policies = open("day-2.txt") do f
        [l for l in eachline(f)]
end

# ╔═╡ d3074564-34b2-11eb-18ff-6fea04c234c9
function parse_policy(policy)
	policy_list = split(policy, "-")
	
	low = parse(Int, policy_list[1])
	
	policy_list = split(policy_list[2], ":")
	
	high = parse(Int, split(policy_list[1], " ")[1])
	letter = split(policy_list[1], " ")[2]
	
	pass = policy_list[2][2:end]

    return (low, high, letter, pass)
end

# ╔═╡ eae21eb0-34b3-11eb-24ca-755e6944cbae
x = get(d, "d", 0)

# ╔═╡ f2c15256-34b3-11eb-1877-93137884b871
begin
	password = "jjjqzm gbjwpj"
	counts = Dict()
	for letter in password
		print(letter)
		if get(counts, letter, 0) == 0
			counts[letter] = 1
		else
			counts[letter] += 1
		end
	end
end

# ╔═╡ 18668b08-34b8-11eb-2494-0dca8f5554cc
typeof(string(split(password)[1])[1])

# ╔═╡ 1e048384-34b4-11eb-2844-f3ea5262e2cf
valid = 2

# ╔═╡ 6d9b9386-34b6-11eb-3783-ed04d2b03826
num_valid = valid == 1 ? 1 : 0

# ╔═╡ d6d42a88-34b2-11eb-233b-898ae7ef3ece
PlutoUI.with_terminal() do
	for policy in policies
		println(policy)
		low, high, letter, password = parse_policy(policy)
		letter_counts = get_counts(password)

		if low < letter_counts[letter] < high
			num_valid += 1


			println("There are $num_valid policies")
			return num_valid
		end
	end
end

# ╔═╡ Cell order:
# ╠═4f1a363a-34a5-11eb-3600-89c48ff142d0
# ╠═1b0ea912-34a9-11eb-2eb1-9558e4ae1546
# ╠═2f333ba6-34a9-11eb-25f5-91d4f926e801
# ╠═6ad68fe8-34ac-11eb-0988-27194a21b1a8
# ╠═038ae156-34af-11eb-1870-5db986ea3f90
# ╠═03719124-34af-11eb-1239-4fa857b9783a
# ╠═f627acc8-34af-11eb-1730-dd3b6f936f27
# ╠═03ad7c00-34b1-11eb-32c5-9dc94a3f4fa3
# ╠═d3074564-34b2-11eb-18ff-6fea04c234c9
# ╠═d6d42a88-34b2-11eb-233b-898ae7ef3ece
# ╠═eae21eb0-34b3-11eb-24ca-755e6944cbae
# ╠═f2c15256-34b3-11eb-1877-93137884b871
# ╠═18668b08-34b8-11eb-2494-0dca8f5554cc
# ╠═1e048384-34b4-11eb-2844-f3ea5262e2cf
# ╠═6d9b9386-34b6-11eb-3783-ed04d2b03826
