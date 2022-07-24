﻿MERGE PM.LanguageCulture AS TARGET
USING (VALUES (1, 'af-ZA',       'Afrikaans (South Africa)',                                        'af',  'PopulationScript', 'Afrikaans (Suid Afrika)',GETDATE()),
              (1, 'am-ET',       'Amharic (Ethiopia)',                                              'am',  'PopulationScript', 'አማርኛ (ኢትዮጵያ)',GETDATE()),
              (1, 'ar-AE',       'Arabic (U.A.E.)',                                                 'ar',  'PopulationScript', 'العربية (الإمارات العربية المتحدة)',GETDATE()),
              (1, 'ar-BH',       'Arabic (Bahrain)',                                                'ar',  'PopulationScript', 'العربية (البحرين)',GETDATE()),
              (1, 'ar-DZ',       'Arabic (Algeria)',                                                'ar',  'PopulationScript', 'العربية (الجزائر)',GETDATE()),
              (1, 'ar-EG',       'Arabic (Egypt)',                                                  'ar',  'PopulationScript', 'العربية (مصر)',GETDATE()),
              (1, 'ar-IQ',       'Arabic (Iraq)',                                                   'ar',  'PopulationScript', 'العربية (العراق)',GETDATE()),
              (1, 'ar-JO',       'Arabic (Jordan)',                                                 'ar',  'PopulationScript', 'العربية (الأردن)',GETDATE()),
              (1, 'ar-KW',       'Arabic (Kuwait)',                                                 'ar',  'PopulationScript', 'العربية (الكويت)',GETDATE()),
              (1, 'ar-LB',       'Arabic (Lebanon)',                                                'ar',  'PopulationScript', 'العربية (لبنان)',GETDATE()),
              (1, 'ar-LY',       'Arabic (Libya)',                                                  'ar',  'PopulationScript', 'العربية (ليبيا)',GETDATE()),
              (1, 'ar-MA',       'Arabic (Morocco)',                                                'ar',  'PopulationScript', 'العربية (المملكة المغربية)',GETDATE()),
              (1, 'ar-OM',       'Arabic (Oman)',                                                   'ar',  'PopulationScript', 'العربية (عمان)',GETDATE()),
              (1, 'ar-QA',       'Arabic (Qatar)',                                                  'ar',  'PopulationScript', 'العربية (قطر)',GETDATE()),
              (1, 'ar-SA',       'Arabic (Saudi Arabia)',                                           'ar',  'PopulationScript', 'العربية (المملكة العربية السعودية)',GETDATE()),
              (1, 'ar-SY',       'Arabic (Syria)',                                                  'ar',  'PopulationScript', 'العربية (سوريا)',GETDATE()),
              (1, 'ar-TN',       'Arabic (Tunisia)',                                                'ar',  'PopulationScript', 'العربية (تونس)',GETDATE()),
              (1, 'ar-YE',       'Arabic (Yemen)',                                                  'ar',  'PopulationScript', 'العربية (اليمن)',GETDATE()),
              (1, 'arn-CL',      'Mapudungun (Chile)',                                              'arn', 'PopulationScript', 'Mapudungun (Chile)',GETDATE()),
              (1, 'as-IN',       'Assamese (India)',                                                'as',  'PopulationScript', 'অসমীয়া (ভাৰত)',GETDATE()),
              (1, 'az-Cyrl-AZ',  'Azeri (Cyrillic) (Azerbaijan)',                                   'az',  'PopulationScript', 'Азәрбајҹан (Азәрбајҹан)',GETDATE()),
              (1, 'az-Latn-AZ',  'Azeri (Latin) (Azerbaijan)',                                      'az',  'PopulationScript', 'Azərbaycan­ılı (Azərbaycanca)',GETDATE()),
              (1, 'ba-RU',       'Bashkir (Russia)',                                                'ba',  'PopulationScript', 'Башҡорт (Россия)',GETDATE()),
              (1, 'be-BY',       'Belarusian (Belarus)',                                            'be',  'PopulationScript', 'Беларускі (Беларусь)',GETDATE()),
              (1, 'bg-BG',       'Bulgarian (Bulgaria)',                                            'bg',  'PopulationScript', 'български (България)',GETDATE()),
              (1, 'bn-BD',       'Bengali (Bangladesh)',                                            'bn',  'PopulationScript', 'বাংলা (বাংলাদেশ)',GETDATE()),
              (1, 'bn-IN',       'Bengali (India)',                                                 'bn',  'PopulationScript', 'বাংলা (ভারত)',GETDATE()),
              (1, 'bo-CN',       'Tibetan (People''s Republic of China)',                           'bo',  'PopulationScript', 'བོད་ཡིག (ཀྲུང་ཧྭ་མི་དམངས་སྤྱི་མཐུན་རྒྱལ་ཁབ།)',GETDATE()),
              (1, 'br-FR',       'Breton (France)',                                                 'br',  'PopulationScript', 'brezhoneg (Frañs)',GETDATE()),
              (1, 'bs-Cyrl-BA',  'Bosnian (Cyrillic) (Bosnia and Herzegovina)',                     'bs',  'PopulationScript', 'босански (Босна и Херцеговина)',GETDATE()),
              (1, 'bs-Latn-BA',  'Bosnian (Latin) (Bosnia and Herzegovina)',                        'bs',  'PopulationScript', 'bosanski (Bosna i Hercegovina)',GETDATE()),
              (1, 'ca-ES',       'Catalan (Catalan)',                                               'ca',  'PopulationScript', 'català (català)',GETDATE()),
              (1, 'co-FR',       'Corsican (France)',                                               'co',  'PopulationScript', 'Corsu (France)',GETDATE()),
              (1, 'cs-CZ',       'Czech (Czech Republic)',                                          'cs',  'PopulationScript', 'čeština (Česká republika)',GETDATE()),
              (1, 'cy-GB',       'Welsh (United Kingdom)',                                          'cy',  'PopulationScript', 'Cymraeg (y Deyrnas Unedig)',GETDATE()),
              (1, 'da-DK',       'Danish (Denmark)',                                                'da',  'PopulationScript', 'dansk (Danmark)',GETDATE()),
              (1, 'de-AT',       'German (Austria)',                                                'de',  'PopulationScript', 'Deutsch (Österreich)',GETDATE()),
              (1, 'de-CH',       'German (Switzerland)',                                            'de',  'PopulationScript', 'Deutsch (Schweiz)',GETDATE()),
              (1, 'de-DE',       'German (Germany)',                                                'de',  'PopulationScript', 'Deutsch (Deutschland)',GETDATE()),
              (1, 'de-LI',       'German (Liechtenstein)',                                          'de',  'PopulationScript', 'Deutsch (Liechtenstein)',GETDATE()),
              (1, 'de-LU',       'German (Luxembourg)',                                             'de',  'PopulationScript', 'Deutsch (Luxemburg)',GETDATE()),
              (1, 'dsb-DE',      'Lower Sorbian (Germany)',                                         'dsb', 'PopulationScript', 'dolnoserbšćina (Nimska)',GETDATE()),
              (1, 'dv-MV',       'Divehi (Maldives)',                                               'dv',  'PopulationScript', 'ދިވެހިބަސް (ދިވެހި ރާއްޖެ)',GETDATE()),
              (1, 'el-GR',       'Greek (Greece)',                                                  'el',  'PopulationScript', 'ελληνικά (Ελλάδα)',GETDATE()),
              (1, 'en-029',      'English (Caribbean)',                                             'en',  'PopulationScript', 'English (Caribbean)',GETDATE()),
              (1, 'en-AU',       'English (Australia)',                                             'en',  'PopulationScript', 'English (Australia)',GETDATE()),
              (1, 'en-BZ',       'English (Belize)',                                                'en',  'PopulationScript', 'English (Belize)',GETDATE()),
              (1, 'en-CA',       'English (Canada)',                                                'en',  'PopulationScript', 'English (Canada)',GETDATE()),
              (1, 'en-GB',       'English (United Kingdom)',                                        'en',  'PopulationScript', 'English (United Kingdom)',GETDATE()),
              (1, 'en-IE',       'English (Ireland)',                                               'en',  'PopulationScript', 'English (Eire)',GETDATE()),
              (1, 'en-IN',       'English (India)',                                                 'en',  'PopulationScript', 'English (India)',GETDATE()),
              (1, 'en-JM',       'English (Jamaica)',                                               'en',  'PopulationScript', 'English (Jamaica)',GETDATE()),
              (1, 'en-MY',       'English (Malaysia)',                                              'en',  'PopulationScript', 'English (Malaysia)',GETDATE()),
              (1, 'en-NZ',       'English (New Zealand)',                                           'en',  'PopulationScript', 'English (New Zealand)',GETDATE()),
              (1, 'en-PH',       'English (Republic of the Philippines)',                           'en',  'PopulationScript', 'English (Philippines)',GETDATE()),
              (1, 'en-SG',       'English (Singapore)',                                             'en',  'PopulationScript', 'English (Singapore)',GETDATE()),
              (1, 'en-TT',       'English (Trinidad and Tobago)',                                   'en',  'PopulationScript', 'English (Trinidad y Tobago)',GETDATE()),
              (1, 'en-US',       'English (United States)',                                         'en',  'PopulationScript', 'English (United States)',GETDATE()),
              (1, 'en-ZA',       'English (South Africa)',                                          'en',  'PopulationScript', 'English (South Africa)',GETDATE()),
              (1, 'en-ZW',       'English (Zimbabwe)',                                              'en',  'PopulationScript', 'English (Zimbabwe)',GETDATE()),
              (1, 'es-AR',       'Spanish (Argentina)',                                             'es',  'PopulationScript', 'Español (Argentina)',GETDATE()),
              (1, 'es-BO',       'Spanish (Bolivia)',                                               'es',  'PopulationScript', 'Español (Bolivia)',GETDATE()),
              (1, 'es-CL',       'Spanish (Chile)',                                                 'es',  'PopulationScript', 'Español (Chile)',GETDATE()),
              (1, 'es-CO',       'Spanish (Colombia)',                                              'es',  'PopulationScript', 'Español (Colombia)',GETDATE()),
              (1, 'es-CR',       'Spanish (Costa Rica)',                                            'es',  'PopulationScript', 'Español (Costa Rica)',GETDATE()),
              (1, 'es-DO',       'Spanish (Dominican Republic)',                                    'es',  'PopulationScript', 'Español (República Dominicana)',GETDATE()),
              (1, 'es-EC',       'Spanish (Ecuador)',                                               'es',  'PopulationScript', 'Español (Ecuador)',GETDATE()),
              (1, 'es-ES',       'Spanish (Spain)',                                                 'es',  'PopulationScript', 'español (España)',GETDATE()),
              (1, 'es-GT',       'Spanish (Guatemala)',                                             'es',  'PopulationScript', 'Español (Guatemala)',GETDATE()),
              (1, 'es-HN',       'Spanish (Honduras)',                                              'es',  'PopulationScript', 'Español (Honduras)',GETDATE()),
              (1, 'es-MX',       'Spanish (Mexico)',                                                'es',  'PopulationScript', 'Español (México)',GETDATE()),
              (1, 'es-NI',       'Spanish (Nicaragua)',                                             'es',  'PopulationScript', 'Español (Nicaragua)',GETDATE()),
              (1, 'es-PA',       'Spanish (Panama)',                                                'es',  'PopulationScript', 'Español (Panamá)',GETDATE()),
              (1, 'es-PE',       'Spanish (Peru)',                                                  'es',  'PopulationScript', 'Español (Perú)',GETDATE()),
              (1, 'es-PR',       'Spanish (Puerto Rico)',                                           'es',  'PopulationScript', 'Español (Puerto Rico)',GETDATE()),
              (1, 'es-PY',       'Spanish (Paraguay)',                                              'es',  'PopulationScript', 'Español (Paraguay)',GETDATE()),
              (1, 'es-SV',       'Spanish (El Salvador)',                                           'es',  'PopulationScript', 'Español (El Salvador)',GETDATE()),
              (1, 'es-US',       'Spanish (United States)',                                         'es',  'PopulationScript', 'Español (Estados Unidos)',GETDATE()),
              (1, 'es-UY',       'Spanish (Uruguay)',                                               'es',  'PopulationScript', 'Español (Uruguay)',GETDATE()),
              (1, 'es-VE',       'Spanish (Venezuela)',                                             'es',  'PopulationScript', 'Español (Republica Bolivariana de Venezuela)',GETDATE()),
              (1, 'et-EE',       'Estonian (Estonia)',                                              'et',  'PopulationScript', 'eesti (Eesti)',GETDATE()),
              (1, 'eu-ES',       'Basque (Basque)',                                                 'eu',  'PopulationScript', 'euskara (euskara)',GETDATE()),
              (1, 'fa-IR',       'Persian (Iran)',                                                  'fa',  'PopulationScript', 'فارسى (ايران)',GETDATE()),
              (1, 'fi-FI',       'Finnish (Finland)',                                               'fi',  'PopulationScript', 'suomi (Suomi)',GETDATE()),
              (1, 'fil-PH',      'Filipino (Philippines)',                                          'fil', 'PopulationScript', 'Filipino (Pilipinas)',GETDATE()),
              (1, 'fo-FO',       'Faroese (Faroe Islands)',                                         'fo',  'PopulationScript', 'føroyskt (Føroyar)',GETDATE()),
              (1, 'fr-BE',       'French (Belgium)',                                                'fr',  'PopulationScript', 'français (Belgique)',GETDATE()),
              (1, 'fr-CA',       'French (Canada)',                                                 'fr',  'PopulationScript', 'français (Canada)',GETDATE()),
              (1, 'fr-CH',       'French (Switzerland)',                                            'fr',  'PopulationScript', 'français (Suisse)',GETDATE()),
              (1, 'fr-FR',       'French (France)',                                                 'fr',  'PopulationScript', 'français (France)',GETDATE()),
              (1, 'fr-LU',       'French (Luxembourg)',                                             'fr',  'PopulationScript', 'français (Luxembourg)',GETDATE()),
              (1, 'fr-MC',       'French (Principality of Monaco)',                                 'fr',  'PopulationScript', 'français (Principauté de Monaco)',GETDATE()),
              (1, 'fy-NL',       'Frisian (Netherlands)',                                           'fy',  'PopulationScript', 'Frysk (Nederlân)',GETDATE()),
              (1, 'ga-IE',       'Irish (Ireland)',                                                 'ga',  'PopulationScript', 'Gaeilge (Éire)',GETDATE()),
              (1, 'gd-GB',       'Scottish Gaelic (United Kingdom)',                                'gd',  'PopulationScript', 'Gàidhlig (An Rìoghachd Aonaichte)',GETDATE()),
              (1, 'gl-ES',       'Galician (Galician)',                                             'gl',  'PopulationScript', 'galego (galego)',GETDATE()),
              (1, 'gsw-FR',      'Alsatian (France)',                                               'gsw', 'PopulationScript', 'Elsässisch (Frànkrisch)',GETDATE()),
              (1, 'gu-IN',       'Gujarati (India)',                                                'gu',  'PopulationScript', 'ગુજરાતી (ભારત)',GETDATE()),
              (1, 'ha-Latn-NG',  'Hausa (Latin) (Nigeria)',                                         'ha',  'PopulationScript', 'Hausa (Nigeria)',GETDATE()),
              (1, 'he-IL',       'Hebrew (Israel)',                                                 'he',  'PopulationScript', 'עברית (ישראל)',GETDATE()),
              (1, 'hi-IN',       'Hindi (India)',                                                   'hi',  'PopulationScript', 'हिंदी (भारत)',GETDATE()),
              (1, 'hr-BA',       'Croatian (Latin) (Bosnia and Herzegovina)',                       'hr',  'PopulationScript', 'hrvatski (Bosna i Hercegovina)',GETDATE()),
              (1, 'hr-HR',       'Croatian (Croatia)',                                              'hr',  'PopulationScript', 'hrvatski (Hrvatska)',GETDATE()),
              (1, 'hsb-DE',      'Upper Sorbian (Germany)',                                         'hsb', 'PopulationScript', 'hornjoserbšćina (Němska)',GETDATE()),
              (1, 'hu-HU',       'Hungarian (Hungary)',                                             'hu',  'PopulationScript', 'magyar (Magyarország)',GETDATE()),
              (1, 'hy-AM',       'Armenian (Armenia)',                                              'hy',  'PopulationScript', 'Հայերեն (Հայաստան)',GETDATE()),
              (1, 'id-ID',       'Indonesian (Indonesia)',                                          'id',  'PopulationScript', 'Bahasa Indonesia (Indonesia)',GETDATE()),
              (1, 'ig-NG',       'Igbo (Nigeria)',                                                  'ig',  'PopulationScript', 'Igbo (Nigeria)',GETDATE()),
              (1, 'ii-CN',       'Yi (People''s Republic of China)',                                'ii',  'PopulationScript', 'ꆈꌠꁱꂷ (ꍏꉸꏓꂱꇭꉼꇩ)',GETDATE()),
              (1, 'is-IS',       'Icelandic (Iceland)',                                             'is',  'PopulationScript', 'íslenska (Ísland)',GETDATE()),
              (1, 'it-CH',       'Italian (Switzerland)',                                           'it',  'PopulationScript', 'italiano (Svizzera)',GETDATE()),
              (1, 'it-IT',       'Italian (Italy)',                                                 'it',  'PopulationScript', 'italiano (Italia)',GETDATE()),
              (1, 'iu-Cans-CA',  'Inuktitut (Syllabics) (Canada)',                                  'iu',  'PopulationScript', 'ᐃᓄᒃᑎᑐᑦ (ᑲᓇᑕ)',GETDATE()),
              (1, 'iu-Latn-CA',  'Inuktitut (Latin) (Canada)',                                      'iu',  'PopulationScript', 'Inuktitut (kanata)',GETDATE()),
              (1, 'ja-JP',       'Japanese (Japan)',                                                'ja',  'PopulationScript', '日本語 (日本)',GETDATE()),
              (1, 'ka-GE',       'Georgian (Georgia)',                                              'ka',  'PopulationScript', 'ქართული (საქართველო)',GETDATE()),
              (1, 'kk-KZ',       'Kazakh (Kazakhstan)',                                             'kk',  'PopulationScript', 'Қазақ (Қазақстан)',GETDATE()),
              (1, 'kl-GL',       'Greenlandic (Greenland)',                                         'kl',  'PopulationScript', 'kalaallisut (Kalaallit Nunaat)',GETDATE()),
              (1, 'km-KH',       'Khmer (Cambodia)',                                                'km',  'PopulationScript', 'ខ្មែរ (កម្ពុជា)',GETDATE()),
              (1, 'kn-IN',       'Kannada (India)',                                                 'kn',  'PopulationScript', 'ಕನ್ನಡ (ಭಾರತ)',GETDATE()),
              (1, 'ko-KR',       'Korean (Korea)',                                                  'ko',  'PopulationScript', '한국어 (대한민국)',GETDATE()),
              (1, 'kok',         'Konkani',                                                         'kok', 'PopulationScript', 'कोंकणी',GETDATE()),
              (1, 'kok-IN',      'Konkani (India)',                                                 'kok', 'PopulationScript', 'कोंकणी (भारत)',GETDATE()),
              (1, 'ky-KG',       'Kyrgyz (Kyrgyzstan)',                                             'kok', 'PopulationScript', 'Кыргыз (Кыргызстан)',GETDATE()),
              (1, 'lb-LU',       'Luxembourgish (Luxembourg)',                                      'lb',  'PopulationScript', 'Lëtzebuergesch (Luxembourg)',GETDATE()),
              (1, 'lo-LA',       'Lao (Lao P.D.R.)',                                                'lo',  'PopulationScript', 'ລາວ (ສ.ປ.ປ. ລາວ)',GETDATE()),
              (1, 'lt-LT',       'Lithuanian (Lithuania)',                                          'lt',  'PopulationScript', 'lietuvių (Lietuva)',GETDATE()),
              (1, 'lv-LV',       'Latvian (Latvia)',                                                'lv',  'PopulationScript', 'latviešu (Latvija)',GETDATE()),
              (1, 'mi-NZ',       'Maori (New Zealand)',                                             'mi',  'PopulationScript', 'Reo Māori (Aotearoa)',GETDATE()),
              (1, 'mk-MK',       'Macedonian (Former Yugoslav Republic of Macedonia)',              'mk',  'PopulationScript', 'македонски јазик (Македонија)',GETDATE()),
              (1, 'ml-IN',       'Malayalam (India)',                                               'ml',  'PopulationScript', 'മലയാളം (ഭാരതം)',GETDATE()),
              (1, 'mn-MN',       'Mongolian (Cyrillic) (Mongolia)',                                 'mn',  'PopulationScript', 'Монгол хэл (Монгол улс)',GETDATE()),
              (1, 'mn-Mong-CN',  'Mongolian (Traditional Mongolian) (People''s Republic of China)', 'mn',  'PopulationScript', 'ᠮᠤᠨᠭᠭᠤᠯ ᠬᠡᠯᠡ (ᠪᠦᠭᠦᠳᠡ ᠨᠠᠢᠷᠠᠮᠳᠠᠬᠤ ᠳᠤᠮᠳᠠᠳᠤ ᠠᠷᠠᠳ ᠣᠯᠣᠰ)',GETDATE()),
              (1, 'moh-CA',      'Mohawk (Canada)',                                                 'moh', 'PopulationScript', 'Kanien''kéha (Canada)',GETDATE()),
              (1, 'mr-IN',       'Marathi (India)',                                                 'mr',  'PopulationScript', 'मराठी (भारत)',GETDATE()),
              (1, 'ms-BN',       'Malay (Brunei Darussalam)',                                       'ms',  'PopulationScript', 'Bahasa Malaysia (Brunei Darussalam)',GETDATE()),              
              (1, 'ms-MY',       'Malay (Malaysia)',                                                'ms',  'PopulationScript', 'Bahasa Malaysia (Malaysia)',GETDATE()),
              (1, 'mt-MT',       'Maltese (Malta)',                                                 'mt',  'PopulationScript', 'Malti (Malta)',GETDATE()),
              (1, 'nb-NO',       'Norwegian, Bokmål (Norway)',                                      'nb',  'PopulationScript', 'norsk, bokmål (Norge)',GETDATE()),
              (1, 'ne-NP',       'Nepali (Nepal)',                                                  'ne',  'PopulationScript', 'नेपाली (नेपाल)',GETDATE()),
              (1, 'nl-BE',       'Dutch (Belgium)',                                                 'nl',  'PopulationScript', 'Nederlands (België)',GETDATE()),
              (1, 'nl-NL',       'Dutch (Netherlands)',                                             'nl',  'PopulationScript', 'Nederlands (Nederland)',GETDATE()),
              (1, 'nn-NO',       'Norwegian, Nynorsk (Norway)',                                     'nn',  'PopulationScript', 'norsk, nynorsk (Noreg)',GETDATE()),
              (1, 'nso-ZA',      'Sesotho sa Leboa (South Africa)',                                 'nso', 'PopulationScript', 'Sesotho sa Leboa (Afrika Borwa)',GETDATE()),
              (1, 'oc-FR',       'Occitan (France)',                                                'oc',  'PopulationScript', 'Occitan (França)',GETDATE()),
              (1, 'or-IN',       'Oriya (India)',                                                   'or',  'PopulationScript', 'ଓଡ଼ିଆ (ଭାରତ)',GETDATE()),
              (1, 'pa-IN',       'Punjabi (India)',                                                 'pa',  'PopulationScript', 'ਪੰਜਾਬੀ (ਭਾਰਤ)',GETDATE()),
              (1, 'pl-PL',       'Polish (Poland)',                                                 'pl',  'PopulationScript', 'polski (Polska)',GETDATE()),
              (1, 'prs-AF',      'Dari (Afghanistan)',                                              'prs', 'PopulationScript', 'درى (افغانستان)',GETDATE()),
              (1, 'ps-AF',       'Pashto (Afghanistan)',                                            'ps',  'PopulationScript', 'پښتو (افغانستان)',GETDATE()),
              (1, 'pt-BR',       'Portuguese (Brazil)',                                             'pt',  'PopulationScript', 'Português (Brasil)',GETDATE()),
              (1, 'pt-PT',       'Portuguese (Portugal)',                                           'pt',  'PopulationScript', 'português (Portugal)',GETDATE()),
              (1, 'qut-GT',      'K''iche (Guatemala)',                                             'qut', 'PopulationScript', 'K''iche (Guatemala)',GETDATE()),
              (1, 'quz-BO',      'Quechua (Bolivia)',                                               'quz', 'PopulationScript', 'runasimi (Bolivia Suyu)',GETDATE()),
              (1, 'quz-EC',      'Quechua (Ecuador)',                                               'quz', 'PopulationScript', 'runasimi (Ecuador Suyu)',GETDATE()),
              (1, 'quz-PE',      'Quechua (Peru)',                                                  'quz', 'PopulationScript', 'runasimi (Peru Suyu)',GETDATE()),
              (1, 'rm-CH',       'Romansh (Switzerland)',                                           'rm',  'PopulationScript', 'Rumantsch (Svizra)',GETDATE()),
              (1, 'ro-RO',       'Romanian (Romania)',                                              'ro',  'PopulationScript', 'română (România)',GETDATE()),
              (1, 'ru-RU',       'Russian (Russia)',                                                'ru',  'PopulationScript', 'русский (Россия)',GETDATE()),
              (1, 'rw-RW',       'Kinyarwanda (Rwanda)',                                            'rw',  'PopulationScript', 'Kinyarwanda (Rwanda)',GETDATE()),
              (1, 'sa-IN',       'Sanskrit (India)',                                                'sa',  'PopulationScript', 'संस्कृत (भारतम्)',GETDATE()),
              (1, 'sah-RU',      'Yakut (Russia)',                                                  'sah', 'PopulationScript', 'саха (Россия)',GETDATE()),
              (1, 'se-FI',       'Sami (Northern) (Finland)',                                       'se',  'PopulationScript', 'davvisámegiella (Suopma)',GETDATE()),
              (1, 'se-NO',       'Sami (Northern) (Norway)',                                        'se',  'PopulationScript', 'davvisámegiella (Norga)',GETDATE()),
              (1, 'se-SE',       'Sami (Northern) (Sweden)',                                        'se',  'PopulationScript', 'davvisámegiella (Ruoŧŧa)',GETDATE()),
              (1, 'si-LK',       'Sinhala (Sri Lanka)',                                             'si',  'PopulationScript', 'සිංහ (ශ්‍රී ලංකා)',GETDATE()),
              (1, 'sk-SK',       'Slovak (Slovakia)',                                               'sk',  'PopulationScript', 'slovenčina (Slovenská republika)',GETDATE()),
              (1, 'sl-SI',       'Slovenian (Slovenia)',                                            'sl',  'PopulationScript', 'slovenski (Slovenija)',GETDATE()),
              (1, 'sma-NO',      'Sami (Southern) (Norway)',                                        'sma', 'PopulationScript', 'åarjelsaemiengiele (Nöörje)',GETDATE()),
              (1, 'sma-SE',      'Sami (Southern) (Sweden)',                                        'sma', 'PopulationScript', 'åarjelsaemiengiele (Sveerje)',GETDATE()),
              (1, 'smj-NO',      'Sami (Lule) (Norway)',                                            'smj', 'PopulationScript', 'julevusámegiella (Vuodna)',GETDATE()),
              (1, 'smj-SE',      'Sami (Lule) (Sweden)',                                            'smj', 'PopulationScript', 'julevusámegiella (Svierik)',GETDATE()),
              (1, 'smn-FI',      'Sami (Inari) (Finland)',                                          'smn', 'PopulationScript', 'sämikielâ (Suomâ)',GETDATE()),
              (1, 'sms-FI',      'Sami (Skolt) (Finland)',                                          'sms', 'PopulationScript', 'sääm´ǩiõll (Lää´ddjânnam)',GETDATE()),
              (1, 'sq-AL',       'Albanian (Albania)',                                              'sq',  'PopulationScript', 'shqipe (Shqipëria)',GETDATE()),
              (1, 'sr-Cyrl-BA',  'Serbian (Cyrillic) (Bosnia and Herzegovina)',                     'sr',  'PopulationScript', 'српски (Босна и Херцеговина)',GETDATE()),
              (1, 'sr-Cyrl-CS',  'Serbian (Cyrillic) (Serbia and Montenegro (Former))',             'sr',  'PopulationScript', 'српски (Србија и Црна Гора (Претходно))',GETDATE()),
              (1, 'sr-Cyrl-ME',  'Serbian (Cyrillic) (Montenegro)',                                 'sr',  'PopulationScript', 'српски (Црна Гора)',GETDATE()),
              (1, 'sr-Cyrl-RS',  'Serbian (Cyrillic) (Serbia)',                                     'sr',  'PopulationScript', 'српски (Србија)',GETDATE()),
              (1, 'sr-Latn-BA',  'Serbian (Latin) (Bosnia and Herzegovina)',                        'sr',  'PopulationScript', 'srpski (Bosna i Hercegovina)',GETDATE()),
              (1, 'sr-Latn-CS',  'Serbian (Latin) (Serbia and Montenegro (Former))',                'sr',  'PopulationScript', 'srpski (Srbija i Crna Gora (Prethodno))',GETDATE()),
              (1, 'sr-Latn-ME',  'Serbian (Latin) (Montenegro)',                                    'sr',  'PopulationScript', 'srpski (Crna Gora)',GETDATE()),
              (1, 'sr-Latn-RS',  'Serbian (Latin) (Serbia)',                                        'sr',  'PopulationScript', 'srpski (Srbija)',GETDATE()),
              (1, 'sv-FI',       'Swedish (Finland)',                                               'sv',  'PopulationScript', 'svenska (Finland)',GETDATE()),
              (1, 'sv-SE',       'Swedish (Sweden)',                                                'sv',  'PopulationScript', 'svenska (Sverige)',GETDATE()),
              (1, 'sw-KE',       'Kiswahili (Kenya)',                                               'sw',  'PopulationScript', 'Kiswahili (Kenya)',GETDATE()),
              (1, 'syr-SY',      'Syriac (Syria)',                                                  'syr', 'PopulationScript', 'ܣܘܪܝܝܐ (سوريا)',GETDATE()),
              (1, 'ta-IN',       'Tamil (India)',                                                   'ta',  'PopulationScript', 'தமிழ் (இந்தியா)',GETDATE()),
              (1, 'te-IN',       'Telugu (India)',                                                  'te',  'PopulationScript', 'తెలుగు (భారత దేశం)',GETDATE()),
              (1, 'tg-Cyrl-TJ',  'Tajik (Cyrillic) (Tajikistan)',                                   'tg',  'PopulationScript', 'Тоҷикӣ (Тоҷикистон)',GETDATE()),
              (1, 'th-TH',       'Thai (Thailand)',                                                 'th',  'PopulationScript', 'ไทย (ไทย)',GETDATE()),
              (1, 'tk-TM',       'Turkmen (Turkmenistan)',                                          'tk',  'PopulationScript', 'türkmençe (Türkmenistan)',GETDATE()),
              (1, 'tn-ZA',       'Setswana (South Africa)',                                         'tn',  'PopulationScript', 'Setswana (Aforika Borwa)',GETDATE()),
              (1, 'tr-TR',       'Turkish (Turkey)',                                                'tr',  'PopulationScript', 'Türkçe (Türkiye)',GETDATE()),
              (1, 'tt-RU',       'Tatar (Russia)',                                                  'tt',  'PopulationScript', 'Татар (Россия)',GETDATE()),
              (1, 'tzm-Latn-DZ', 'Tamazight (Latin) (Algeria)',                                     'tzm', 'PopulationScript', 'Tamazight (Djazaïr)',GETDATE()),
              (1, 'ug-CN',       'Uyghur (People''s Republic of China)',                            'ug',  'PopulationScript', 'ئۇيغۇرچە (جۇڭخۇا خەلق جۇمھۇرىيىتى)',GETDATE()),
              (1, 'uk-UA',       'Ukrainian (Ukraine)',                                             'uk',  'PopulationScript', 'україньска (Україна)',GETDATE()),
              (1, 'ur-PK',       'Urdu (Islamic Republic of Pakistan)',                             'ur',  'PopulationScript', 'اُردو (پاکستان)',GETDATE()),
              (1, 'uz-Cyrl-UZ',  'Uzbek (Cyrillic) (Uzbekistan)',                                   'uz',  'PopulationScript', 'Ўзбек (Ўзбекистон)',GETDATE()),
              (1, 'uz-Latn-UZ',  'Uzbek (Latin) (Uzbekistan)',                                      'uz',  'PopulationScript', 'U''zbek (U''zbekiston Respublikasi)',GETDATE()),
              (1, 'vi-VN',       'Vietnamese (Vietnam)',                                            'vi',  'PopulationScript', 'Tiếng Việt (Việt Nam)',GETDATE()),
              (1, 'wo-SN',       'Wolof (Senegal)',                                                 'wo',  'PopulationScript', 'Wolof (Sénégal)',GETDATE()),
              (1, 'xh-ZA',       'isiXhosa (South Africa)',                                         'xh',  'PopulationScript', 'isiXhosa (uMzantsi Afrika)',GETDATE()),
              (1, 'yo-NG',       'Yoruba (Nigeria)',                                                'yo',  'PopulationScript', 'Yoruba (Nigeria)',GETDATE()),
              (1, 'zh-CHS',      'Chinese (Simplified)',                                            'zh',  'PopulationScript', '中文(简体)',GETDATE()),
              (1, 'zh-CHT',      'Chinese (Traditional)',                                           'zh',  'PopulationScript', '中文(繁體)',GETDATE()),
              (1, 'zh-CN',       'Chinese (People''s Republic of China)',                           'zh',  'PopulationScript', '中文(中华人民共和国)',GETDATE()),
              (1, 'zh-HK',       'Chinese (Hong Kong S.A.R.)',                                      'zh',  'PopulationScript', '中文(香港特别行政區)',GETDATE()),
              (1, 'zh-MO',       'Chinese (Macao S.A.R.)',                                          'zh',  'PopulationScript', '中文(澳門特别行政區)',GETDATE()),
              (1, 'zh-SG',       'Chinese (Singapore)',                                             'zh',  'PopulationScript', '中文(新加坡)',GETDATE()),
              (1, 'zh-TW',       'Chinese (Taiwan)',                                                'zh',  'PopulationScript', '中文(台灣)',GETDATE()),
              (1, 'zu-ZA',       'isiZulu (South Africa)',                                          'zu',  'PopulationScript', 'isiZulu (iNingizimu Afrika)',GETDATE()))
AS SOURCE (IsActive,
           LanguageCultureCode,
           EnglishName,
           LanguageCode,
           CreatedBy,
           NativeName,
           CreatedDate)
ON TARGET.LanguageCultureCode = SOURCE.LanguageCultureCode
WHEN MATCHED THEN UPDATE SET TARGET.LanguageCode       = SOURCE.LanguageCode,
                             TARGET.EnglishName        = SOURCE.EnglishName,
                             TARGET.NativeName         = SOURCE.NativeName,
                             TARGET.IsActive           = SOURCE.IsActive,
                             TARGET.CreatedBy          = SOURCE.CreatedBy,
                TARGET.CreatedDate          = SOURCE.CreatedDate
WHEN NOT MATCHED THEN INSERT (LanguageCode,
                              LanguageCultureCode,
                              EnglishName,
                              NativeName,
                              IsActive,
                              CreatedBy,CreatedDate)
                      VALUES (SOURCE.LanguageCode,
                              SOURCE.LanguageCultureCode,
                              SOURCE.EnglishName,
                              SOURCE.NativeName,
                              SOURCE.IsActive,
                              SOURCE.CreatedBy,
                              SOURCE.CreatedDate);