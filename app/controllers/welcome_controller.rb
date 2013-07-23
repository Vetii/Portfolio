require 'digest/sha1'
require "json"
require 'open-uri'

class WelcomeController < ApplicationController
  def index
    @info = parseJSON('Info.json')
  end

  def login
  end

  def log
    @usr = params[:post].permit(:login, :password)
    hashes = Hash.new
    hashes[:login]  = Digest::SHA1.hexdigest(@usr[:login])
    hashes[:password] = Digest::SHA1.hexdigest(@usr[:password])

    if(hashes[:login] == "c5efcae830c799db996e4cc4d16def8b2d28265e" && 
       hashes[:password] == "b0ccacdc67a59134ae17172ec79d248eb9e28e1f") then
      session[:login] = true 
      redirect_to root_path
    else

      render :login
    end
  end

  def unlog
    session[:login] = nil
  end

  def curriculum
    @info = parseJSON('Info.json')
    @edu  = parseJSON('Education.json')
    @exp  = parseJSON('Experience.json')
    @skills = parseJSON('Skills.json')
    @interests = parseJSON('Interests.json')
    @trips = parseJSON('Trips.json')
    @languages = parseJSON('Languages.json')
  end

  def contact
    @info = parseJSON('Info.json')
  end

  private
  def parseJSON(filename)
    filename = "#{Rails.root}/app/assets/#{filename}"
    f = File.open(filename)
    to_parse = String.new
    # CHOMP: all on one line.
    f.each_line do |line|
      to_parse << line.chomp
    end
    hash = JSON.parse(to_parse)
    return hash
  end
end
