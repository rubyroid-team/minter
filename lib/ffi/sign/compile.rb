# frozen_string_literal: true

out_path = "./sign"
arg_string = ""
{
  out: out_path,
  targets: ["linux/amd64", "darwin/amd64"],
  buildmode: "c-shared"
}.each_pair do |name, args|
  arg_string += "-#{name}"
  arg_string += "=#{[args].flatten.join(',')}" unless args.nil?
  arg_string += " "
end

puts "xgo #{arg_string.strip} ./"
system("xgo #{arg_string.strip} ./")
