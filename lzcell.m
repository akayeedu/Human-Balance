%{ 
outputs the Lempel-Ziv Complexity of a symbolic sequence input
anything under quotes is read as a single symbol: 'Q' and '[0;1;2]'
the input needs to be a cell array of character strings
aaabbaba should be formatted as {'a';'a';'a';'b';'b';'a';'b';'a'}
%}

 function lzc = lzcell(cell_array)

  %%starting at the beginning of the sequence (unit complexity)
  complexity_count = 1; 
  [i, j] = deal(2, 2);

  %%run complexity checks until the end of the sequence
  seq_len = length(cell_array);
  while j <= seq_len 

    %index ranges of the word and prefix
    word_range = i:j; 
    prefix_range = 1 : (j-1); 
    
    %the word and prefix as symbolic sequences
    prefix_str = [cell_array{prefix_range}]; 
    word_str = [cell_array{word_range}]; 


    %%the complexity check: is the word a subsequence of the prefix?
    %if not, increase complexity by 1 and move to next word
    if ~contains(prefix_str, word_str) 
      complexity_count = complexity_count + 1; 
      i = j + 1; 
      j = i;

    else %otherwise, extend the word by 1 symbol and re-evaluate
      j = j + 1;
    end
  end

  lzc = complexity_count; %return total complexity count
    end
