module SafelyInstantiate

  def get_models 
    models = [] 
    Dir.glob( RAILS_ROOT + '/app/models/*' ).each do |f| 
      if not(File.basename(f) =~ /~/)
        models << File.basename( f ).gsub( /^(.+).rb/, '\1')
      end
    end 
    models 
  end 
  
  def classname_to_model(classname)
    if get_models.member?(classname)
      eval(classname.classify)
    else
      raise "Something unsafe is trying to be instantiated." 
    end
  end
    
end
