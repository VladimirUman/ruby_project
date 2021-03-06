User.delete_all
User.create!(name: 'admin', password: 'admin', email: 'admin@example.com')

Product.delete_all

Category.delete_all
Category.create!(id: 1, name: 'Books', image: Rails.root + 'app/assets/images/logo.jpg')
Category.create!(id: 2, name: 'Development', parent_id: 1, image: Rails.root + 'app/assets/images/rails.png')
Category.create!(id: 3, name: 'FrontEnd', parent_id: 1, image: Rails.root + 'app/assets/images/rails.png')
Category.create!(id: 4, name: 'BackEnd', parent_id: 1, image: Rails.root + 'app/assets/images/rails.png')
Category.create!(id: 5, name: 'Administration', parent_id: 1, image: Rails.root + 'app/assets/images/rails.png')

Product.create!(title: 'Rails, Angular, Postgres, and Bootstrap',
  description:
    %{<p>
      <em>Powerful, Effective, and Efficient Full-Stack Web Development</em>
      As a Rails developer, you care about user experience and performance,
      but you also want simple and maintainable code. Achieve all that by
      embracing the full stack of web development, from styling with
      Bootstrap, building an interactive user interface with AngularJS, to
      storing data quickly and reliably in PostgreSQL. Take a holistic view of
      full-stack development to create usable, high-performing applications,
      and learn to use these technologies effectively in a Ruby on Rails
      environment.
      </p>},
  category_id: 3,    
  price: 45.00,
  image: Rails.root + 'app/assets/images/dcbang.jpg')
# . . .
Product.create!(title: 'Seven Mobile Apps in Seven Weeks',
  description:
    %{<p>
      <em>Native Apps, Multiple Platforms</em>
      Answer the question “Can we build this for ALL the devices?” with a
      resounding YES. This book will help you get there with a real-world
      introduction to seven platforms, whether you’re new to mobile or an
      experienced developer needing to expand your options. Plus, you’ll find
      out which cross-platform solution makes the most sense for your needs.
      </p>},
  category_id: 2,
  price: 26.00,
  image: Rails.root + 'app/assets/images/7apps.jpg')
# . . .

Product.create!(title: 'Ruby Performance Optimization',
  description:
    %{<p>
      <em>Why Ruby Is Slow, and How to Fix It</em> 
      You don’t have to accept slow Ruby or Rails performance. In this
      comprehensive guide to Ruby optimization, you’ll learn how to write
      faster Ruby code—but that’s just the beginning. See exactly what makes
      Ruby and Rails code slow, and how to fix it. Alex Dymo will guide you
      through perils of memory and CPU optimization, profiling, measuring,
      performance testing, garbage collection, and tuning. You’ll find that
      all those “hard” things aren’t so difficult after all, and your code
      will run orders of magnitude faster.
      </p>},
  category_id: 4,
  price: 46.00,
  image: Rails.root + 'app/assets/images/lorem.jpg')
  # . . .

  Product.create!(title: '2 Rails, Angular, Postgres, and Bootstrap',
  description:
    %{<p>
      <em>Powerful, Effective, and Efficient Full-Stack Web Development</em>
      As a Rails developer, you care about user experience and performance,
      but you also want simple and maintainable code. Achieve all that by
      embracing the full stack of web development, from styling with
      Bootstrap, building an interactive user interface with AngularJS, to
      storing data quickly and reliably in PostgreSQL. Take a holistic view of
      full-stack development to create usable, high-performing applications,
      and learn to use these technologies effectively in a Ruby on Rails
      environment.
      </p>},
  category_id: 3,    
  price: 45.00,
  image: Rails.root + 'app/assets/images/dcbang.jpg')
# . . .
Product.create!(title: '2 Seven Mobile Apps in Seven Weeks',
  description:
    %{<p>
      <em>Native Apps, Multiple Platforms</em>
      Answer the question “Can we build this for ALL the devices?” with a
      resounding YES. This book will help you get there with a real-world
      introduction to seven platforms, whether you’re new to mobile or an
      experienced developer needing to expand your options. Plus, you’ll find
      out which cross-platform solution makes the most sense for your needs.
      </p>},
  category_id: 3,
  price: 26.00,
  image: Rails.root + 'app/assets/images/7apps.jpg')
# . . .

Product.create!(title: '2 Ruby Performance Optimization',
  description:
    %{<p>
      <em>Why Ruby Is Slow, and How to Fix It</em> 
      You don’t have to accept slow Ruby or Rails performance. In this
      comprehensive guide to Ruby optimization, you’ll learn how to write
      faster Ruby code—but that’s just the beginning. See exactly what makes
      Ruby and Rails code slow, and how to fix it. Alex Dymo will guide you
      through perils of memory and CPU optimization, profiling, measuring,
      performance testing, garbage collection, and tuning. You’ll find that
      all those “hard” things aren’t so difficult after all, and your code
      will run orders of magnitude faster.
      </p>},
  category_id: 4,
  price: 46.00,
  image: Rails.root + 'app/assets/images/lorem.jpg')
  # . . .
  
  Product.create!(title: '3 Rails, Angular, Postgres, and Bootstrap',
  description:
    %{<p>
      <em>Powerful, Effective, and Efficient Full-Stack Web Development</em>
      As a Rails developer, you care about user experience and performance,
      but you also want simple and maintainable code. Achieve all that by
      embracing the full stack of web development, from styling with
      Bootstrap, building an interactive user interface with AngularJS, to
      storing data quickly and reliably in PostgreSQL. Take a holistic view of
      full-stack development to create usable, high-performing applications,
      and learn to use these technologies effectively in a Ruby on Rails
      environment.
      </p>},
  category_id: 3,    
  price: 45.00,
  image: Rails.root + 'app/assets/images/dcbang.jpg')
# . . .
Product.create!(title: '3 Seven Mobile Apps in Seven Weeks',
  description:
    %{<p>
      <em>Native Apps, Multiple Platforms</em>
      Answer the question “Can we build this for ALL the devices?” with a
      resounding YES. This book will help you get there with a real-world
      introduction to seven platforms, whether you’re new to mobile or an
      experienced developer needing to expand your options. Plus, you’ll find
      out which cross-platform solution makes the most sense for your needs.
      </p>},
  category_id: 4,
  price: 26.00,
  image: Rails.root + 'app/assets/images/7apps.jpg')
# . . .

Product.create!(title: '3 Ruby Performance Optimization',
  description:
    %{<p>
      <em>Why Ruby Is Slow, and How to Fix It</em> 
      You don’t have to accept slow Ruby or Rails performance. In this
      comprehensive guide to Ruby optimization, you’ll learn how to write
      faster Ruby code—but that’s just the beginning. See exactly what makes
      Ruby and Rails code slow, and how to fix it. Alex Dymo will guide you
      through perils of memory and CPU optimization, profiling, measuring,
      performance testing, garbage collection, and tuning. You’ll find that
      all those “hard” things aren’t so difficult after all, and your code
      will run orders of magnitude faster.
      </p>},
  category_id: 4,
  price: 46.00,
  image: Rails.root + 'app/assets/images/lorem.jpg')
  # . . .
  
  Product.create!(title: '4 Rails, Angular, Postgres, and Bootstrap',
  description:
    %{<p>
      <em>Powerful, Effective, and Efficient Full-Stack Web Development</em>
      As a Rails developer, you care about user experience and performance,
      but you also want simple and maintainable code. Achieve all that by
      embracing the full stack of web development, from styling with
      Bootstrap, building an interactive user interface with AngularJS, to
      storing data quickly and reliably in PostgreSQL. Take a holistic view of
      full-stack development to create usable, high-performing applications,
      and learn to use these technologies effectively in a Ruby on Rails
      environment.
      </p>},
  category_id: 5,    
  price: 45.00,
  image: Rails.root + 'app/assets/images/dcbang.jpg')
# . . .
Product.create!(title: '4 Seven Mobile Apps in Seven Weeks',
  description:
    %{<p>
      <em>Native Apps, Multiple Platforms</em>
      Answer the question “Can we build this for ALL the devices?” with a
      resounding YES. This book will help you get there with a real-world
      introduction to seven platforms, whether you’re new to mobile or an
      experienced developer needing to expand your options. Plus, you’ll find
      out which cross-platform solution makes the most sense for your needs.
      </p>},
  category_id: 5,
  price: 26.00,
  image: Rails.root + 'app/assets/images/7apps.jpg')
# . . .

Product.create!(title: '4 Ruby Performance Optimization',
  description:
    %{<p>
      <em>Why Ruby Is Slow, and How to Fix It</em> 
      You don’t have to accept slow Ruby or Rails performance. In this
      comprehensive guide to Ruby optimization, you’ll learn how to write
      faster Ruby code—but that’s just the beginning. See exactly what makes
      Ruby and Rails code slow, and how to fix it. Alex Dymo will guide you
      through perils of memory and CPU optimization, profiling, measuring,
      performance testing, garbage collection, and tuning. You’ll find that
      all those “hard” things aren’t so difficult after all, and your code
      will run orders of magnitude faster.
      </p>},
  category_id: 5,
  price: 46.00,
  image: Rails.root + 'app/assets/images/lorem.jpg')