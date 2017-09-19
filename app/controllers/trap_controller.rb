class TrapController < ApplicationController

  def visit
    logger.info 'Visited: ' + params['trap_id'].to_s
    RequestItem.new(
        trap_id: params['trap_id'].to_s,
        r_date: Time.now,
        r_data: request.headers.env.select {
            |k, _| k.in?(ActionDispatch::Http::Headers::CGI_VARIABLES) || k =~ /^HTTP_/
        }.reject{|_,v| v.empty?}
    ).save
  end

end
