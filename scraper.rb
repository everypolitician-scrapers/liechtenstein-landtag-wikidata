#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

# Find all P39s
query = 'SELECT DISTINCT ?item WHERE { ?item wdt:P39 wd:Q21328607 }'
p39s = EveryPolitician::Wikidata.sparql(query)

names = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://de.wikipedia.org/wiki/Liste_der_Mitglieder_des_liechtensteinischen_Landtags_(2013)',
  after: '//span[@id="Liste_der_Mitglieder"]',
  xpath: '//table[.//th[contains(.,"Fraktion")]]//tr[td]//td[1]//a[not(@class="new")]/@title',
)  |
EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://de.wikipedia.org/wiki/Liste_der_Mitglieder_des_liechtensteinischen_Landtags_(2009)',
  after: '//span[@id="Liste_der_Mitglieder"]',
  xpath: '//table[.//th[contains(.,"Fraktion")]]//tr[td]//td[1]//a[not(@class="new")]/@title',
)  |
EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://de.wikipedia.org/wiki/Liste_der_Mitglieder_des_liechtensteinischen_Landtags_(2005)',
  after: '//span[@id="Liste_der_Mitglieder"]',
  xpath: '//table[.//th[contains(.,"Fraktion")]]//tr[td]//td[1]//a[not(@class="new")]/@title',
)
EveryPolitician::Wikidata.scrape_wikidata(ids: p39s, names: { de: names })

