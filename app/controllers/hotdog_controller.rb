# frozen_string_literal: true

require 'google/cloud/vision'

class HotdogController < ApplicationController
  def index; end

  def upload
    image_annotator = Google::Cloud::Vision.image_annotator

    # The name of the image file to annotate
    file_name = params[:picture].path

    # Performs label detection on the image file
    response = image_annotator.label_detection image: file_name
    response.responses.each do |res|
      puts 'Labels:'
      res.label_annotations.each do |label|
        puts label.description
        @result = 'Hotdog!' if label.description.downcase == 'hot dog'
      end
    end

    @result ||= 'Not hotdog!'
    render 'index'
  end
end
