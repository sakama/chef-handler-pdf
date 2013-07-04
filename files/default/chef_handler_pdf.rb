class Pdf < Chef::Handler

  def report
    Chef::Log.info "Resources updated this run:"
    #run_status.updated_resources.each {|r| Chef::Log.info "  #{r.to_s}"}
    #run_status.node.each {|r| Chef::Log.info "  #{r.to_s}"}
    run_status.run_context.cookbook_collection.each {|r| Chef::Log.info "  #{r.to_s}"}
    #run_status.all_resources.each {|r| Chef::Log.info "  #{r.to_s}"}
  end
end
