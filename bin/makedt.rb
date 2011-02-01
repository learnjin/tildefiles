#!/usr/bin/env ruby -w
#
#

def make_tree(list, level, prefix)
  return [] if level >= list.length - 1

  from_node, arcs = list[level]

  res = []
  arcs.each_with_index do |arc, i|
    to_node = "#{list[level+1][0]}_#{prefix}.#{i}" 
    res << "#{from_node}_#{prefix} -- #{to_node} [label = \"#{arc}\"]"
    res += make_tree(list, level+1, "#{prefix}.#{i}")
  end

  return res
end

def mkn(list, level, prefix)
  return [] if level >= list.length - 1

end


out = []
out << 'graph G{'
out << 'node [shape="rect"]'

foo = [ ["Versicherung", %w(pkv kkv)],
        ["Arzt", %w(weise Vaselini)],
        ["Tag", %w(urlaub feiertag)]
      ]

out += make_tree(foo.to_a, 0, "0")

out << '}'

puts out.join("\n")
