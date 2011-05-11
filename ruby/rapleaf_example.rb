# Copyright 2010 Rapleaf
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

require './rapleaf_api'

=begin
  This example script takes an e-mail as a command line argument 
  and queries Rapleaf's database for any data associated with
  the provided e-mail (unknown fields are left blank)
=end

email = ARGV.first
api = RapleafApi::Api.new('MY_API_KEY') # replace with your API key
begin
  response = api.query_by_email(email)
  if response.empty?
    puts "No Data Found"
  else
    response.each do |k,v|
      puts "#{k} = #{v}"
    end
  end
rescue Exception => e
  puts e.message
end