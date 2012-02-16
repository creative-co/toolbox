class Hash
  def method_missing(meth, *args, &block)
    self[meth] if args.size == 0 && meth !~ /[!?=]$/
  end
end