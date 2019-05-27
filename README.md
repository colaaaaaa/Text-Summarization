# Text-Summarization
Automatic text summarization is a process of condensing text which preserve the important content in the text. Automatic summarization techniques are either extractive or abstractive. In the abstractive technique, the summary is created by representing the important content contained in the original document. Extractive techniques work by selecting important sentences from the original text to create a meaningful summary.
## TextRank Algorithm
TextRank is based on the PageRank algorithm (http://ilpubs.stanford.edu:8090/422/1/1999-66.pdf).
### These are the similarities between PageRank and TextRank.
* In place of web pages, we use sentences from the text documents.
* Similarity between any two sentences is used as an equivalent to the web page transition probability.
* The similarity scores are stored in a square matrix, similar to the matrix M used for PageRank.
#### And these are the steps to TextRank method:
* The first step would be to concatenate all the text contained in the articles.
* Then split the text into individual sentences.
* In the next step, we will find vector representation for each and every sentence.
* Similarities between sentence vectors are then calculated and stored in a matrix.
* The similarity matrix is then converted into a graph, with sentences as vertices and similarity scores as edges, for sentence rank calculation.
* Finally, a certain number of top-ranked sentences form the final summary.
## CoRank Algorithm
CoRank algorithm is an improvement over the TextRank algorithm. CoRank incorporates word-sentence relationship for ranking the sentences as described in the paper(https://www.researchgate.net/publication/311690538_Word-Sentence_Co-Ranking_for_Automatic_Extractive_Text_Summarization).

## Implementation details
We implement TextRank/CoRank in R and python. We used python NLTK to split the sentences of the text documents. NLTK is a powerful library which handles many special cases to break sentences. Breaking the text document into sentences and after ranking the sentences combining them to generate summary this part is done in python. And rest of the implementation is done in R.
* First part of the implementation is to break the text document into sentences. For that we used python script(break_sentences.py) present in folder summary_files. This script takes file name as command line arguments then it splits the document into the sentences. These sentences will store in the folder tempdir. Each sentence will store in separate text file.
* The actual implementation of the algorithm is in R file(CoRank.r). This script read sentences from the folder tempdir and create the corpus of these sentences. This corpus then coverted into word-sentence matrix which further converted into the sentence-sentence matrix (adjacency matrix) using jaccard/cosine similarity. This method(CoRank) combine TextRank and word sentence relationship. For that author linearly add TextRank and Word-sentence relationships. We used $\alpha$     







