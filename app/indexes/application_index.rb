class ApplicationIndex < Chewy::Index
  settings analysis: {
    analyzer: {
      ngram: {
        tokenizer: :ngram_3_20,
        filter: %i(lowercase)
      },
      phone: {
        tokenizer: :phone
      }
    },
    tokenizer: {
      ngram_3_20: {
        type: :edgeNGram,
        min_gram: 3,
        max_gram: 20,
        token_chars: %i(letter digit)
      },
      phone: {
        type: :ngram,
        min_gram: 1,
        max_gram: 15,
        token_chars: %i(digit)
      }
    }
  }
end
