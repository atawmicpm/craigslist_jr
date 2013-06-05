categories = ['Autos', 
              'Real Estate', 
              'Casual Encounters',
              'Jobs',
              'Electronics',
              'Parties' ]

categories.map{|name| Category.create(name: name)}
