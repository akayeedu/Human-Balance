%{
Optional program to visualize how the Lempel-Ziv algorithm decomposes a
symbolic sequence.

Identical to lzcell.m, but outputs a list of words that were not subsequences
of the prefixes (a slower program). This is called the exhaustive history.

Input is a cell array of character strings such as {'a';'b';'b';'a'}
Cell array of rank vectors can look like {'[0;1;2]';'[2;1;0]';'[1;0;2]'}
%}

 function word_list = ex_hist(cell_array)

  %first word in the exhaustive history is the first symbol of the sequence
  word_list = cell_array{1};
  
  seq_len = length(cell_array);
  i = 2;
  j = 2;

  while j <= seq_len
    prefix_range = 1 : (j-1);
    word_range = i:j;

    prefix_str = [cell_array{prefix_range}];
    word_str = [cell_array{word_range}];

    if ~contains(prefix_str, word_str)
      
      %if the word is not a subsequence of the prefix, add it to the list
      word_list = vertcat(word_list,{word_str});
      i = j + 1;
      j = i;

    else
      j = j + 1;
    end
  end
 end

 %full annotations on the Lempel-Ziv algorithm are on the lzcell.m file.