
vocabs = []

File.open(ARGV[0],"r").each do |line|
  next unless line =~ /^(\S+) (\S+) \[(.+)\] \/(.+)\//

  vocabs << { :traditional=>$1, :simplified=>$2,:pinyin=>$3,:meanings => $4.split('/') }
end

# distinct chinese words
uniq_words = vocabs.map{ |v| v[:traditional]}.uniq

uniq_words.each do |this_charseq|
  entry = this_charseq + "\t"
  vocabs.select{ |x| x[:traditional] == this_charseq}.each_with_index do |ssp,i|
    if i > 0
      entry << "\\n\\n\\n\\n"
    end
    entry << "#{ssp[:simplified]} [#{ssp[:traditional]}] (#{ssp[:pinyin]})\\n"
    foo = ssp[:meanings]
    foo = foo.map{ |x| "#{foo.index(x)+1}) #{x}"}
    entry << foo.join("\\n")
  end
  puts entry

  vocabs.delete(this_charseq)
end



#vocabs.map{|v| v[:traditional]}.uniq.each do |this_char|
  
#   same_spelling =   vocabs.select{ |c| c[:traditional] == this_char}

#   entry = this_char + "\t"
#   vocabs.select{ |x| x[:traditional] == this_char}.each do |ssp|
#     entry << "#{ssp[:simplified]} [#{ssp[:traditional]}] (#{ssp[:pinyin]})\\n"

#     foo = ssp[:meanings]
#     foo = foo.map{ |x| "#{foo.index(x)+1}) #{x}"}
    
#     entry << foo.join("\\n") << "\\n\\n\\n\\n"
    
#   end

#   vocabs.delete_if{ |e| e[:traditional] == this_char}

#   puts vocabs.size

  #puts entry

#end
