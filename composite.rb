class Category
  def add_taxon; end
  def remove_taxon; end
  def build_tree; end
end

class Taxonomy < Category
  def initialize
    @taxons = []
  end

  def add_taxon(taxon)
    @taxons.append(taxon)
  end

  def remove_taxon(taxon)
    @taxons.remove(taxon)
  end

  def build_tree
    tree = []

    @taxons.each.with_index { |taxon, index| tree.append("#{taxon.build_tree} ##{index}") }

    "Taxonomy{#{tree.join(' <--> ')}}"
  end
end

class Taxon < Category
  def build_tree
    'Taxon'
  end
end


catalog = Taxonomy.new

branch_1 = Taxonomy.new
branch_1.add_taxon(Taxon.new)
branch_1.add_taxon(Taxon.new)
branch_1.add_taxon(Taxon.new)

branch_2 = Taxonomy.new
branch_2.add_taxon(Taxon.new)
branch_2.add_taxon(Taxon.new)

branch_3 = Taxonomy.new
branch_3.add_taxon(branch_2)
branch_3.add_taxon(branch_1)

branch_4 = Taxonomy.new
branch_4.add_taxon(Taxon.new)
branch_4.add_taxon(branch_3)

branch_5 = Taxonomy.new
branch_5.add_taxon(Taxon.new)
branch_5.add_taxon(Taxon.new)
branch_5.add_taxon(Taxon.new)
branch_5.add_taxon(Taxon.new)
branch_5.add_taxon(Taxon.new)

branch_6 = Taxonomy.new
branch_6.add_taxon(Taxon.new)
branch_6.add_taxon(Taxon.new)
branch_6.add_taxon(Taxon.new)
branch_6.add_taxon(branch_4)
branch_6.add_taxon(branch_5)

catalog.add_taxon(branch_6)

puts catalog.build_tree
