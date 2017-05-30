#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

# Find all P39s
query = 'SELECT DISTINCT ?item WHERE { ?item wdt:P39 wd:Q21328607 }'
p39s = EveryPolitician::Wikidata.sparql(query)

m = {}

m[2017] = EveryPolitician::Wikidata.wikipedia_xpath(
  url: 'https://de.wikipedia.org/wiki/Liste_der_Mitglieder_des_liechtensteinischen_Landtags_(2017)',
  after: '//span[@id="Liste_der_Mitglieder"]',
  xpath: '//table[.//th[contains(.,"Fraktion")]]//tr[td]//td[1]//a[not(@class="new")]/@title',
)

m[2013] = EveryPolitician::Wikidata.wikipedia_xpath(
  url: 'https://de.wikipedia.org/wiki/Liste_der_Mitglieder_des_liechtensteinischen_Landtags_(2013)',
  after: '//span[@id="Liste_der_Mitglieder"]',
  xpath: '//table[.//th[contains(.,"Fraktion")]]//tr[td]//td[1]//a[not(@class="new")]/@title',
)

m[2009] = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://de.wikipedia.org/wiki/Liste_der_Mitglieder_des_liechtensteinischen_Landtags_(2009)',
  after: '//span[@id="Liste_der_Mitglieder"]',
  xpath: '//table[.//th[contains(.,"Fraktion")]]//tr[td]//td[1]//a[not(@class="new")]/@title',
)

m[2005] = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://de.wikipedia.org/wiki/Liste_der_Mitglieder_des_liechtensteinischen_Landtags_(2005)',
  after: '//span[@id="Liste_der_Mitglieder"]',
  xpath: '//table[.//th[contains(.,"Fraktion")]]//tr[td]//td[1]//a[not(@class="new")]/@title',
)

EveryPolitician::Wikidata.scrape_wikidata(ids: p39s, names: { de: m.values.flatten.uniq })

