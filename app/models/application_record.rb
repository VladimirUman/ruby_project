class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  #Cleanup unused dragonfly files
  def self.cleanup
    image_root = Dragonfly.app.datastore.root_path
    
    self.clean_folder(image_root)
  end
  
  def self.clean_folder(folder)
    image_root = folder
    
    meta_ending = ".meta.yml"
    
    Dir.foreach(folder) do |item|
      next if item == '.' or item == '..'
      path_to_check = File.join(image_root, item)
      
      if File.directory? path_to_check
        self.clean_folder(path_to_check)
        next
      end
      
      if item.last(meta_ending.length) == meta_ending
        next
      end
      
      subfolder = image_root.dup
      subfolder.slice!( Dragonfly.app.datastore.root_path )
      item_name = File.join(subfolder, item)
      
      if item_name[0] == "/"
        item_name.slice!(0)
      end
      
      file = File.join(image_root, item)
      unless ProductImage.find_by(image_uid: item_name) || Category.find_by(image_uid: item_name)  || NewsItem.find_by(image_uid: item_name)
        File.delete(file)
        begin
          File.delete(file + meta_ending)
        rescue Exception => e
          
        end
        
        puts "Deleting process: #{file}"
      end
    end
  end
  #....

end
