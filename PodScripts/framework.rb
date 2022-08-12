#!/usr/bin/ruby

require 'cocoapods'

module MiGuScource
    ModuleNames =  Hash.new
    ModuleBinRepo = 'ssh://git@10.25.193.140:7993/ios/mgpodrepobin.git'
    ModuleSourceRepo = 'ssh://10.25.193.140:7993/ios/mgpodrepo.git'
    class SpecialSource
        attr_accessor :source, :params
        def initialize(source, params=nil)
            @source = source
            @params = params
            # MiGuScource::ModuleBinRepo = source;
            # if params != nil
            #     podsName = params[:"podsName"];
            #     podsName.each do |name|
            #         MiGuScource::ModuleNames[name] = source
            #     end
            # end
        end
    end
end

module Pod
    class Podfile
      class TargetDefinition
        def detect_prebuilt_pod(name, requirements)
          currentUseBin = false
          options = requirements.last
          if options.is_a?(Hash)
            if options[:bin]
              options[:source] = MiGuScource::ModuleBinRepo
              currentUseBin = true
            else
              options[:source] = MiGuScource::ModuleSourceRepo
            end
            options.delete(:bin)
            requirements.pop if options.empty?
          else
            options = Hash.new
            options[:source] = MiGuScource::ModuleSourceRepo
            requirements.insert(1,options);
          end

          if options[:path]
            options.delete(:source)
          end

          if MiGuScource::ModuleNames[name] == nil
            MiGuScource::ModuleNames[name] = currentUseBin
          else
            if MiGuScource::ModuleNames[name] != currentUseBin
              STDERR.puts("\n[!] #{name} has multiple pod sources".red)
              exit 1
            end
          end
          
        end
  
        # ---- patch method ----
        # We want modify `store_pod` method, but it's hard to insert a line in the
        # implementation. So we patch a method called in `store_pod`.
        original_parse_inhibit_warnings = instance_method(:parse_inhibit_warnings)
        define_method(:parse_inhibit_warnings) do |name, requirements|
          detect_prebuilt_pod(name, requirements)
          original_parse_inhibit_warnings.bind(self).call(name, requirements)
        end

        
      end
    end
  end
  
