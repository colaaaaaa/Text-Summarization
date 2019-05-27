# Text-Summarization
Automatic text summarization is a process of condensing text which preserve the important content in the text. Automatic summarization techniques are either extractive or abstractive. In the abstractive technique, the summary is created by representing the important content contained in the original document. Extractive techniques work by selecting important sentences from the original text to create a meaningful summary.
## TextRank Algorithm
TextRank is based on the PageRank algorithm (http://ilpubs.stanford.edu:8090/422/1/1999-66.pdf).
These are the similarities between PageRank and TextRank.
** [In place of web pages, we use sentences from the text documents.
** [Similarity between any two sentences is used as an equivalent to the web page transition probability.
** [The similarity scores are stored in a square matrix, similar to the matrix M used for PageRank.
And these are the steps to TextRank method:
** [The first step would be to concatenate all the text contained in the articles.
** [Then split the text into individual sentences.
** [In the next step, we will find vector representation for each and every sentence.
** [Similarities between sentence vectors are then calculated and stored in a matrix.
** [The similarity matrix is then converted into a graph, with sentences as vertices and similarity scores as edges, for sentence rank calculation.
** [Finally, a certain number of top-ranked sentences form the final summary.
## CoRank Algorithm
CoRank algorithm is an improvement over the TextRank algorithm. CoRank incorporates word-sentence relationship for ranking the sentences as described in the paper(https://www.researchgate.net/publication/311690538_Word-Sentence_Co-Ranking_for_Automatic_Extractive_Text_Summarization).




