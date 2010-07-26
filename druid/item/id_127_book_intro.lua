-- Buch f�r das Druidensystem
-- Falk
-- Buch "Alchemie 1"
require("base.books")
require("base.common")

module("druid.item.id_127_book_intro", package.seeall)

-- UPDATE common SET com_script='druid.item.id_127_book_intro' WHERE com_itemid = 127;

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
--User:inform("debug 127-1")
   if base.books.InitBook() then
 base.books.AddLanguage("common language",0);
      base.books.AddGermanBookText("Druiden-Almanach\n\nBuch 1\n\nEinf�hrung in das Druidentum",0,0,0);
      base.books.AddGermanBookText("Vorwort\n\nMein halbes Leben lang habe ich mich der Erforschung der Geheimnisse des Druidentums gewidmet. Zahllose N�chte verbrachte ich �ber uralten Formeln, experimentierte mit weitgehend bekannten und unbekannten Substanzen und suchte nach den Formeln und Regeln, nach denen die g�ttliche Natur die Bausteine des Lebens und Wirkens zusammensetzt.",0,0,0);
      base.books.AddGermanBookText("In diesen B�chern, die zusammengenommen den Druiden-Almanach darstellen, habe ich mein Wissen niedergelegt, auf das kommende Generationen ihren Nutzen daraus ziehen und die hohe Kunst der Alten aufs Neue beleben werden. Und obwohl ich am Ende meiner Tage angelangt, auf ein durchaus beachtliches Wissen zur�ckblicke, bleiben manche Dinge im Dunkeln, schemenhaft und vage.",0,0,0);
      base.books.AddGermanBookText("Man mag mir verzeihen, wenn ich eingestehe:\nIch wei� alles - ich wei� nichts!",0,0,0);
      base.books.AddGermanBookText("M�ge Euch, gewogener Leser, Eldan die Weisheit verleihen, aus den Rudimenten meiner Erkenntnisse weiterf�hrende Schl�sse zu ziehen.\nM�gen die G�tter Euch Einblick gew�hren in die unendlichen H�hen und Tiefen des Druidentums.\n\nEldan auf all Euren Wegen.\n\nKloster Eldan,\n\n\nFalk vom Wald",0,0,0);
      base.books.AddGermanBookText("Einf�hrung\n\nUnter den Magiebegabten Gobiaths stellen die Druiden die Gruppe der Forscher und Entdecker. Anders als die Magier ben�tigen Druiden nicht den g�ttlichen Odem des Mana, ihre Runenzauber stellen eher ein notwendiges Beiwerk dar, als dass sie das Ziel druidischen Strebens und Trachtens w�ren. Das Augenmerk des Forschers ruht auf der Alchemie, dem zentralen Thema des Druidentums.",0,0,0);
      base.books.AddGermanBookText("Gute F�higkeiten bei der Wahrnehmung, Intelligenz und Willenskraft sind dem Druiden von Nutzen, andererseits sind die Kenntnisse der Alten in der Literatur und hier insbesondere in der Pflanzenkunde legend�r.",0,0,0);
      base.books.AddGermanBookText("Dem Novizen werden die Prozeduren auf den ersten Blick banal erscheinen, mit wenigen rechten Handgriffen vermag ein jeder halbwegs Gebildete einen Kr�utersud zuzubereiten. Erst allm�hlich begreift der Sch�ler, welch unendlichen Reichtum die G�tter in den wenigen Regeln der alchemistischen Kunst bereitgestellt haben.",0,0,0);
      base.books.AddGermanBookText("�ber allen Regeln der Alchemie aber dominiert die oberste Tugend des Druiden: seine Verschwiegenheit. Die Preisgabe oder gar Niederlegung alchemistischer Formeln und Prozeduren f�r eine unbestimmte Vielzahl von Mitwissern gilt in der Gemeinschaft der Druiden als Sakrileg. Allenfalls dem eifrigen Sch�ler offenbart der Meister einige seiner Rezepte, die Niederlegung solcher erfolge stets mit gro�er Sorgfalt und nur in verschl�sselter Weise.",0,0,0);
      base.books.AddGermanBookText("Alles beginnt mit der Herstellung eines einfachen Pflanzen-Sudes. �ber seinem Kupferkessel bereite man das Extrakt einer Pflanze und bef�lle damit eine saubere leere Flasche. Die zuvor farblose Fl�ssigkeit f�rbt sich gr�n, ein deutliches Anzeichen f�r die erfolgreiche Zubereitung des Auszuges. Fast bin ich geneigt zu sagen: \'das ist alles\'.",0,0,0);
      base.books.AddGermanBookText("Man kann diese Prozedur beliebig wiederholen, immer neue Pflanzen wandern in die Flasche, der Pflanzensud beh�lt dabei stets seine gr�ne F�rbung. Und doch steckt in dieser simplen Handhabung bereits der Schl�ssel zu einem sp�teren Heiltrunk, einem Verwandlungstrank oder einer m�chtigen Waffe gegen Feinde. Man mag es bereits ahnen: Das Geheimnis liegt in der Mischung, die Macht des druidischen Wirkens ruht in den Zutaten, den jeweils verwendeten Pflanzen.",0,0,0);
      base.books.AddGermanBookText("�ber die Wirkung der Pflanzen im einzelnen mag der interessierte Leser an anderer Stelle ausf�hrliche Beschreibungen erhalten, in diesem Buch wollen wir uns mit dem grundlegenden Mechanismus besch�ftigen, den die g�ttliche Natur in den alchemistisch bedeutsamen Pflanzen verborgen h�lt. In zu verstehen, stellt den Schl�ssel dar zum sp�teren Erfolg.",0,0,0);
      base.books.AddGermanBookText("Jede Pflanze enth�lt genau zwei Wirkstoffe, im Ganzen gibt es derer acht. Jeweils eine der beiden Wirkstoffe hat zur Folge, dass sich im Sud diese Substanz anreichert, w�hrend der andere Wirkstoff eine Senkung einer zweiten Substanz bewirkt. dadurch hat es die Natur eingerichtet, dass alle Pflanzen f�r sich betrachtet eine ausgeglichene, neutrale Wirkung haben, solange man sie eben nicht in einem Sud aufbereitet.",0,0,0);
      base.books.AddGermanBookText("Werden mehrere Pflanzen der gleichen Art zugegeben, erh�ht, bzw. senkt sich der Gehalt des jeweiligen Wirkstoffes um jeweils eine Stufe. Jeweils vier solcher Stufen kennen wir, sind die jeweiliegn Endzust�nde erreicht, sprechen wir entweder von einer \'ges�ttigten Anreicherung\' oder von einer \'hoch toxischen\' Wirkung des jeweiligen Wirkstoffes. Eine Anreicherung �ber diese Endpunkte hinaus ist jedoch nicht m�glich, aber, mit den geeigneten Pflanzen, lassen sich die Gehalte wieder in die jeweils andere Richtung, dem Neutralpunkt zu, beeinflussen.",0,0,0);
      base.books.AddGermanBookText("Wie bereits erw�hnt finden wir in einem Sud acht solcher Wirkstoffe, mit anderen Worten es ensteht durch die richtige Mischung an Pflanzen ein Wirkungscode, der f�r die sp�tere Nutzung des Gebr�us von entscheidender Bedeutung ist.",0,0,0);
      base.books.AddGermanBookText("Im Folgenden will ich also nun die Wirkstoffe im Einzelnen beschreiben, wir befinden uns also schon mitten in alchemistischen Analyse. Was ich noch zu erw�hnen verga�: Der Novize lernt mit der Herstellung der Pflanzen-Extrakte zugleich, so er denn die Weihen zum Druiden erhalten hat, den Umgang mit seinen ersten Runen, als Belohnung seiner M�hen, sozusagen. Diese ersten Runen widmen sich dem Umgang mit den Pflanzen, der Bestimmung der Inhaltstoffe und ihrer Qualit�t. Diese Qualit�t ist stets im Auge zu behalten, denn bereits eine minderwertige Pflanze kann einen ganzen Sud verderben und seine sp�tere Leistung mindern. Man verwende also stets die besten Pflanzen, die man bekommen kann, wenn man einen Trank von hoher G�te schaffen will. Andererseits w�re es pure Verschwendung, w�rde man in einen Sud, dessen Wirkungsgrad bereits durch mittelm��ige Pflanzen begrenzt ist, hochwertige Zus�tze beimischen. Ein Sud kann immer nur so gut werden, wie seine schlechtesten Zutaten, das merke sich der gelehrige Sch�ler.",0,0,0);
      base.books.AddGermanBookText("Doch nun zur�ck zu den Wirkstoffen. Woher ihre Bezeichnungen stammen tut wenig zu Sache, ich fand die Namen in alten Pergamentrollen, Aufzeichnungen einer l�ngst vergangenen Zeit. An erster Stelle zu nennen w�re demnach Adrazin zu nennen, das auch als der Atem des Lebens bekannt ist. Adrazin soll au�erdem f�r den Muskelaufbau verantwortlich sein.",0,0,0);
	  base.books.AddGermanBookText("Echolon: Dieser Wirkstoff zeichnet sich verantwortlich f�r Willenskraft. Manchen Forschungen zufolge haben Kinder, denen man hohe Dosen Echolon verabreichte, ein erstaunliches K�rperwachstum erfahren. Halblinge m�ssten demzufolge, k�nnte man es nur untersuchen, einen Mangel an diesem Wirkstoff aufweisen. Der dritte Stoff nennt sich Orcanol. Orcanol befindet sich in praktisch allen Lebensmitteln und bestimmt das S�ttigungsgef�hl des K�rpers. Au�erdem gilt diese Substanz als Droge f�r die Sinneswahrnehmung.",0,0,0);
      base.books.AddGermanBookText("Illidrium hei�t der Wirkstoff dem nachgesagt wird Gl�ck anzuziehen. Au�erdem hei�t es, in K�rpern besonders intelligenter Wesen w�rde Illidrium in hohem Ma�e produziert. \nAn f�nfter Stelle w�re Hyperborelium zu nennen, ein Stoff mit dem gr��ten Einfluss auf die Leber, als Entgiftungszentrale des K�rpers und der k�rperlichen Belastbarkeit und Regeneration. \nFenolin setzt die Reihe der Wirkstoffe fort und zeichnet sich verantwortlich f�r Geschicklichkeit und Fingerfertigkeit und kommt daher Handwerkern wie Dieben gleicherma�en zustatten.",0,0,0);
	  base.books.AddGermanBookText("An vorletzter Stelle erscheint Caprazin, ein Stoff der besonders zur F�rderung der Schnellkraft angewandt wird. Eine L�hmung soll demzufolge bei einer Unterversorgung des K�rpers mit Caprazin zu beobachten sein. Ihm werden zudem Eigenschaften zugesprochen, die sich auf die Lern- und Merkf�higkeit beziehen. \nAm Ende der Reihe steht Dracolin. Magiern ist Dracolin wegen seiner engen Beziehung zur arkanen Kraft von besonderer Bedeutung. Ihm wird zudem nachgesagt, es beeinflusse die Einstellung zum Leben, die pers�nliche Aura und die Moral. Ich hege da manchmal meine Zweifel, sicher scheint jedoch zu sein, dass Dracolin das Wesen an sich und in seiner spirituellen Gesamtheit zu beeinflussen scheint.",0,0,0);
	  base.books.AddGermanBookText("Zusammenfassend l�sst sich also sagen, dass jede Pflanze f�r die Beeinflussung zweier dieser Wirkstoffe verantwortlich zeichnet, jeweils einen erh�hend, einen senkend. Man unterscheidet nun zweierlei grundverschiedene Trankarten, die Gruppe der Heil und St�rkungstr�nke, die unmittelbar auf die beschriebenen Eigenschaften einwirken und solche, deren Bedeutung nur indirekt, �ber den Geheimschl�ssel ihres Wirkstoffgehaltes erschlossen werden k�nnen.",0,0,0);
      base.books.AddGermanBookText("Wir wenden uns zun�chst der Gruppe der Heil- und St�rkungstr�nken zu.\nDie Herstellung eines reinen Heiltrankes stellt sicher keine Aufgabe f�r den druidischen Neuling dar. Das liegt weniger an der erforderlichen Kenntnis der pflanzlichen Inhaltsstoffe, als vielmehr an dem Umstand, dass jede Wirkung im sud auch eine Gegenwirkung erzeugt. sind diese beiden Wirkstoffe wie zuvor beschrieben in der Pflanze noch neutralisiert, wirken sich im Sud beide Wirkstoffe unmittelbar auf die sp�tere Trankwirkung aus. Das hei�t nichts anderes, als dass Heiltr�nke im Normalfall mehr als nur eine einzige Wirkung entfalten. Solche Nebenwirkungen m�gen im einzelnen erw�nscht sein, in der Regel versucht man aber, diese entweder in Grenzen zu halten, oder aber auf solche Wirkungen zu begrenzen, die beim sp�teren Anwender den geringsten Nachteil bewirken. zusammenfassend aber l�sst sich sagen, dass Heil und St�rkungstr�nke immer wenigstens eine geringe Wirkung zeigen.",0,0,0);
      base.books.AddGermanBookText("Anders sieht dies aus bei den Tr�nken, deren Effekte indirekt durch die verwendeten Zutaten bestimmt werden. in dieser Gruppe f�hrt nicht jede Kombination von Pflanzen automatisch auch zu einem Effekt. Nur die genaue Einhaltung der Rezeptur erzeugt die geforderte Wirkstoffkombination, wobei ein jeder Wirkstoff exakt in der richtigen Dosierung vorliegen muss. Fordert das Rezept eine geringe Menge Echolon, so wird auch nur diese Dosierungsangabe zum gew�nschten Effekt f�hren. Aus den an anderer Stelle beschriebenen Zusammenh�ngen zwischen den Wirkstoffen und bestimmten Heil- oder St�rkungswirkungen kann bei dieser Gruppe kein R�ckschluss auf die Rezeptur gezogen werden. Ja, es scheint fast so, als h�tten die G�tter wahllos in die Pflanzenkiste gegriffen, als sie die druidischen Formeln f�r diese Gruppe von Tr�nken entwarfen.\nAuch ist hier die Bezeichnung \'Trank\' irref�hrend, sind einige dieser Produkte doch �berhaupt nicht zur inneren Anwendung vorgesehen. Unter dieser Gruppe finden wir Wurfgeschosse beneso wie Polituren und D�ngemittel, ebenso nat�rlich Verwandlung,-Stabilisierungs- oder Erkenntnistr�nke. Der Einfachheit halber wollen wir aber bei allen druidischen Produkten, die aus Pflanzensud gewonnen werden, verallgemeinernd von \'Tr�nken\' sprechen.",0,0,0);
      base.books.AddGermanBookText("Wir wissen nun also, wie man einen Sud braut und das in diesem Pflanzenauszug bereits alle Bausteine f�r den sp�teren Trank festgelegt wurden. Wie aber komme ich nun vom Pflanzensud zum Trank? Hier hilft uns wieder die Erkenntnis, das bei Pflanzen die Wirkstoffe stabilisiert, im Sud aber augel�st, quasi in Bewegung geraten sind. Um aus einem Pflanzensud einen stabilen, lagerungsf�higen Trank herzustellen, muss der Sud wiederum stabilisiert werden. Dies geschieht durch Katalyse unter Zuhilfenahme anorganischer Substanzen, in unserem Fall von Mineralien. Nur Druiden besitzen die Gabe der katalytischen Umsetzung, der nichtdruidische Helfer und Sudbrauer sei eindringlich davor gewarnt, sich an dieser Technik zu versuchen. Aus dem jeweils verwendeten Mineral erkl�rt sich �brigens auch die sp�tere endg�ltige F�rbung des Trankes. So f�rben Rubine den gr�nen Sud rot, Amethysten dagenen verleihen dem Trank ein ins Rotblau gehende Antlitz.",0,0,0);
      base.books.AddGermanBookText("Damit endet dieser erste Band des Druiden-Almanach. Band 2 wird sich mit den Pflanzen und ihren Besonderheiten befassen. Im dritten Band der Reihe werden wir uns mit den druidischen Runen und Ritualen befassen, den Ordensregeln, denen ein jeder Druide sich zu unterwerfen hat, sowie der Technik der Filterung.",0,0,0);
      base.books.AddGermanBookText("Eine Sache sollte ich noch erw�hnen: Um Zugang zu erhalten zu druidischen Fertigkeiten braucht es nicht mehr als einen guten Schluck eines Kr�utersudes. Der muss jedoch in v�lliger Harmonie und Ausgeglichenehit angesetzt sein und darf keinerlei Abweichungen vom inneren Ruhepol der Inhaltsstoffe aufweisen.",0,0,0);
      base.books.AddGermanBookText("Erst wer durch solchen Trunk die Weihen des Druiden erhalten hat, die im �brigen v�llig unspektakul�r verlaufen, ist in der Lage, die geheimen Rezepte zu lesen, die dieser Schrein noch bereith�lt.",0,0,0);
      base.books.AddGermanBookText("Doch Vorsicht: Auf jedem dieser uralten Pergamente lastet auch ein unausl�schlicher Fluch, der bei alzu eifrigem Studium schon manchen Druiden wenn auch nicht um den Verstand, so doch um die Fr�chter manch harter Arbeit betrogen hat.",0,0,0);
      base.books.AddGermanBookText("Manchmal bin ich geneigt zu sagen: Auch wenn der Weg ungleich l�nger und entbehrungsreicher ist, am Ende zahlen sich eigene Forschungsergebnisse aus. Wer den schnellen Erfolg und die L�sungen um manchen Zaubertrank in den Pergamenten sucht, der mag am Ende arg entt�uscht von dannen ziehen.",0,0,0);
      base.books.AddGermanBookText("Lass Dir meine Worte Warnung sein, teuer haben wir Ungl�ubigen f�r unsere Ungeduld gezahlt.",0,0,0);

      ---
	base.books.AddEnglishBookText("Druid-Almanac\n\nBook 1\n\nIntroduction to Druidism ",0,0,0);
	base.books.AddEnglishBookText("Forword\n\n For most of my long life, I have devoted myself to researching the mysteries of the druid. I have spent countless nights upon ancient formulae, experimented with known and unknown substances and searched for the techniques and rules governing the fundamentals of Life and Work, which \'Divine Nature\' created. ",0,0,0);
	base.books.AddEnglishBookText("In these books which collectively are the druid\'s almanac, I have laid down my knowledge from which the coming generations will draw from and birth the high art of the old people anew. Although I look back at the end of my days with great wisdom, I am concerned that some things remain in the darkness, shadowy and vague.",0,0,0);
	base.books.AddEnglishBookText("Forgive me as I declare: I know everything � yet, I know nothing!",0,0,0);
	base.books.AddEnglishBookText("Noble reader, if this wisdom compels Eldan to pull inspiration from the Rudiments of my knowledge for you, may the gods grant insight of the infinite heights and depths of the Druids as well.\nEldan guides all our paths.\n\nEldan Monastary,\n\n\nFalk vom Wald",0,0,0);
	base.books.AddEnglishBookText("Introduction\n\n From the ranks of magic-gifted Gobaithans, the druids are composed of a group of researchers and discoverers. Different than the magicians, druids needed not the divine spark of Mana, rather, their runic magic requires other necessary objects, which would become the purpose of druidic striving and ambition. The attention of the researcher is Alchemy, the central subject of the druid.",0,0,0);
	base.books.AddEnglishBookText("Good perception abilities, intelligence and willpower are to the druid useful, on the other hand, knowledge of the ancient tongue is helpful for research..",0,0,0);
	base.books.AddEnglishBookText("The procedures will seem to the novice at first sight simple, with a few right procedures, everyone is able to prepare a herbal brew, with little education. Only gradually, the pupil understands the infinite wealth the gods have provided, with but a few rules of the Alchemist Arts.",0,0,0);
	base.books.AddEnglishBookText("However, the greatest virtue of the druid is dominant over all laws of alchemy: his discretion. The sharing or even writing down of alchemist formulae and procedures for an uncertain number of confidants, is in the community of the druids a \'sacrilege\'. At most the master reveals some of his secrets only to the keen pupil, and writing down such always occurs with great care and only in a coded way.",0,0,0);
	base.books.AddEnglishBookText("Everything begins with the production of an easy plant brew. In a copper kettle, one prepares the extract of a plant and collects it with a clean empty bottle. The previously colorless liquid turns green, a clear sign of a successful preparation of the extract. I can almost even wistfully say:\'that is all\'.",0,0,0);
	base.books.AddEnglishBookText("One can repeat this procedure several times, always brewing new plants within the bottle, and yet the plant brew always keeps its green tint. And, nevertheless, the key is in this simple procedure to create a later remedial potion, a conversion potion or a mighty weapon against enemies. One might even guess it: The secret lies in the mixture, the power of the druidic work rests in the ingredients, and the plants used in each case.",0,0,0);
	base.books.AddEnglishBookText("About the effects of the plants in detail the interested reader may receive detailed descriptions elsewhere, in this book we want to deal with the basic mechanism which the divine nature hides in the alchemically significant plants. To understand them, is the key to later success.",0,0,0);
	base.books.AddEnglishBookText("Every plant contains exactly two active substances; or so it is in most cases. In each case one or both active substances infers that within the brew this substance accumulates, while the other active substance causes a lowering of the former substance. Therefore, it is so in nature that all plants have a well-balanced, neutral effect for themselves, seen only as long as one does not process them into a brew.",0,0,0);
	base.books.AddEnglishBookText("If several plants of the same kind are added, they increase, or the balance of the respective active substance decrease about a step in each case. We know in each case after four such steps, the maximum final state is reached, we speak either of \'zenith enrichment\' or \'highly toxic\' effect of the respective active substance. Nevertheless, more enrichment after these terminator points is not possible, but, with the suitable plants, the balances change themselves again in the opposite direction, to the neutral point, the balance of the two.",0,0,0);
	base.books.AddEnglishBookText("As already mentioned we find in a brew eight such active substances, in other words it is modified by the right mixture of plants, creating an effect which is for use later by the researcher to determine what for.",0,0,0);
	base.books.AddEnglishBookText("Next, I want to describe the active substances individually, for we are already in the middle of alchemical analysis. What I have so far forgotten to mention: The novice learns with the production of the plant extracts at the same time, thus he has received then the inauguration of the druid, the contact with his first runes, as a reward for his efforts, so to speak. These first runes devote themselves to the contact with the plants, the regulation of the content's materials and their quality. This quality is always to be watched, because already an inferior plant can spoil a whole brew and diminish it's usefulness. One should always use the best plants which one can get if one wants to create a potion of high quality. On the other hand, it would be a pure waste, if one would add in a brew whose efficiency is already limited by mediocre plants, high-quality additions. A brew can always become good only in such a way, and the observant pupil notices this of his worst ingredients already.",0,0,0);
	base.books.AddEnglishBookText("However, back to the active substances. I found their names in old parchment roles, recordings of the ancient�s last research. I shall name them. Firstly, Adrazin: which is also known as the \'breath of the life\'. In addition, Adrazin should be responsible for the building of muscles.",0,0,0);
	base.books.AddEnglishBookText("Echolon continues the list of the active substances and is responsible for willpower. According to other researchers the children to whom one gives high doses of Echolon grow amazingly tall. Halflings therefore, if one could only examine them, show a lack of this eighth active substance. \nThe third material is called Orcanol. Orcanol is in practically all food and certainly the satisfied feeling of the body. In addition, this substance counts as a drug, responsible for sensory perception.",0,0,0);
	base.books.AddEnglishBookText("Illidrium is the active substances that is linked with luck and success. In any case, it is produced by especially intelligent beings, their bodies producing Illidrium in high quantities. \nAnd The fifth element, Hyperborelium it is called, has the biggest influence on the liver, as the part of the body that decontaminates and purifies the body. It is ascribed qualities which aid learning, endurance, physical load capacity and regeneration. \nFenolin continues the list of the active substances and is responsible to increase skill and thus is addictive to craftsmen and thieves alike.",0,0,0);
	base.books.AddEnglishBookText("And in nearly last place, Caprazin appears, a material involved with strength and speed. A paralysis may be caused therefore within the body with Caprazin. \nAt the end of the list Dracolin stands. To magicians Dracolin is important because of its narrow respect to their special arcane strength. It also influences the quality of life, the personal aura and the morality. I am sometimes skeptical of the effects of the supposed effects of this, nevertheless it certainly seems to be that to experience Hyperborelium the soul within and his spiritual whole becomes at peace.",0,0,0);
	base.books.AddEnglishBookText("To summarize, it can be said that every plant includes two of these active substances, in each case raising, and lowering. Now that one distinguishes these two things totally, creating different potions: the group, the welfare and strengthening potions, which have an effect immediately on the described qualities and those whose meaning can only be known indirectly, about the confidential key of their potency.",0,0,0);
	base.books.AddEnglishBookText("First, we turn to the group of the remedial potions and strengthening potions. \nThe production of a pure remedial potion teaches the druid novice more than any other. This is not so much because of the necessary knowledge of the plant-like materials, than rather the fact that every effect also generates a counter-effect as well. If these both active substances are still neutralized as they are naturally in the plant, both active substances work against themselves in the brew immediately and the effect of the potion later. This is inconsequential, as the remedial potions normally unfold no more than only one single effect. Such side effects may be welcome in practice, however, as a rule one tries to control this to a some extent, to such effects which cause the slightest disadvantage with the later user. To summarize, it can be said that welfare and strengthening potions display always at least one low effect.",0,0,0);
	base.books.AddEnglishBookText("This works differently than the potions whose effects are determined indirectly by the used ingredients. In this group every combination of plants does not lead automatically to an effect as well. Only the precise observance of the recipe generates the demanded active substance combination and every active substance must be precisely in the right dosage. If the prescription demands a small quantity of Echolon, only this dosage information will lead to the desired effect. From the connections described in other places, between the active substances and certain remedial effects or strengthening effects, no part of the recipe can be skipped within this group. Yes, it seems almost in such a way as if the gods had reached at random in the plant box when they created the druidic formulae for this group of potions.\nAlso elusive here is the named \'potion \', nevertheless, some of these products are not planned at all to the internal application. Under this group we find projectiles, Potions like polishes and fertilizers, as of course conversion,-Serums-or knowledge potions. However, for simplicity, we want to call all druidic products which are created from plant brew \'potions \' in general.",0,0,0);
	base.books.AddEnglishBookText("Now we know how one brews a potion and take extracts from plants already, and how all components for the later potion are prepared. However, how do I come at last from the plant brew to the potion? Again the knowledge which stabilizes the active substances with plants helps us, however in the brew they are all stirred up, virtually in motion. To produce a stable potion capable of storage of a plant brew, the brew must be stabilized again. This happens by the catalyst of inorganic substances, in our case, minerals. Only druids own the gift of the catalytic conversion, the non-druidic assistant and brew brewer would be warned urgently against trying this technology. The later final coloring of the potion also is determined by the mineral used in each case, by the way. Thus rubies color the green brew to red, then the amethysts hue may lend the potion a color going toward violet.",0,0,0);
	base.books.AddEnglishBookText("With this ends this first Chapter of the druid\'s almanac. Chapter 2 will deal with the plants and their specific features. In the third chapter of the list, we will deal with the druidic runes and rituals, to the Order rules to which every druid has to submit, as well as the technology of filtering.",0,0,0);
	base.books.AddEnglishBookText("One more thing i should bring up: To get access to the druid abilities it does not need much more as a sip of a hebal brew. But this herbal brew need to be in perfect harmony, without any variance to the internal balance between the active substances.",0,0,0);
	base.books.AddEnglishBookText("Only who is devoted as druid with such herbal brew, by the way a really unspectacular act, will have the ability to read the secret recipes, which are also placed at this book rest.",0,0,0);
	base.books.AddEnglishBookText("But attention: All of these very old scrolls are inherented by an ineffaceable curse, that ready caused, that druids did not lost their mind, but are mulcted by it of the success of their hard work.",0,0,0);
	base.books.AddEnglishBookText("Sometimes I want to say: Even if the way might be longer and full of privations, in the end the own research results will pay off. Those who only search for the quick win and easy solutions to get the potion recipes, will leave in frustration",0,0,0);
	base.books.AddEnglishBookText("Let be my words a warning for you, the nonbeliver have payed for their impatience.",0,0,0);

    end
	base.books.SendBookPage(User,Sourceitem.id_data,Counter);
end   


function UseItemWithField( User, SourceItem, TargetPos, Counter, Param, ltstate )
--User:inform("debug 127-2")
  world:erase(SourceItem,1)
end

function UseItemWithCharacter( User, SourceItem, TargetCharacter, Counter, Param, ltstate )
--User:inform("debug 127-3")
  world:erase(SourceItem,1)
end

function LookAtItem( User, Item )
--User:inform("debug 127-4")
	if base.books.InitTitle() then
      base.books.AddGermanBookTitle("Buch mit dem Titel \"Druiden-Almanach Band 2\"",0);
      base.books.AddEnglishBookTitle("Book with the title \"Alchemy 2\"",0);
	end
	base.books.GetBookItemInform(User,Item);
end
