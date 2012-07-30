# Options:
# * :tries - Number of retries to perform. Defaults to 1.
# * :on - The Exception on which a retry will be performed. Defaults to Exception, which retries on any Exception.
# * :sleep - Interval between tries in sec. Defaults to 1.
#
# Example
# =======
#   retryable(:tries => 1, :on => OpenURI::HTTPError) do
#     # your code here
#   end

# from http://blog.codefront.net/2008/01/14/retrying-code-blocks-in-ruby-on-exceptions-whatever/

def retryable(options = {}, &block)
  opts = {:tries => 1, :on => StandardError}.merge(options)
  retry_exception, retries = opts[:on], opts[:tries]
  begin
    return yield
  rescue retry_exception
    sleep opts[:sleep] || 1

    retry if (retries -= 1) > 0
  end
  yield
end