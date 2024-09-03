/* A script that needs to pasted in the postscript field of the extenstion
 * BetterBibTeX. This does some postprocessing of the zotero entries before 
 * writing them to the bib file
    */

// Add a new entry called number that contains the arxiv number
if (Translator.BetterBibTeX && zotero.number && tex.entrytype == 'misc') {
  var num = zotero.number
  if (!num.startsWith("ar")) { tex.add({ name : 'number', value: 'arXiv:' + num}) }
}

// Remove DOI for arxiv entries and add number as a field
if (Translator.BetterBibTeX && !zotero.number && tex.entrytype == 'misc' && zotero.DOI) {
   var DOI = zotero.DOI
   var num = DOI.split("/")[1]
   num = num.replace("arXiv.","arXiv:")
   tex.add({ name : 'number', value : num } )
}

//If author list greater 20 replace the rest with et.al
var creators_max = 20;
var author_others = { creatorType: 'author', lastName: 'et al', firstName: null };

var creators = zotero.creators.slice(0) // store the author list in creatros
var authors = [];                                 // final list that is corrected

// tex.add( { name:'keys',value:keySS } )
// tex.add( { name:'cress',value:JSON.stringify(creators[0])} )

if(zotero.creators.length>creators_max) {
    for (var i = 0; i < creators_max; i++){
         authors.push(creators[i])
} 
authors.push(author_others)
}
zotero.creators=authors
tex.addCreators()
// tex.add( { name:'test',value:JSON.stringify(authors) } )
