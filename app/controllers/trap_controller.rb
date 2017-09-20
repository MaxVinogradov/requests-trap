class TrapController < ApplicationController

  def visit
    logger.info 'Visited: ' + params['trap_id'].to_s
    ri = RequestItem.new(
        trap_id: params['trap_id'].to_s,
        r_date: Time.now,
        r_data: request.headers.env.select {
            |k, _| k.in?(ActionDispatch::Http::Headers::CGI_VARIABLES) || k =~ /^HTTP_/
        }.reject{|_,v| v.empty?}
    )
    ActionCable.server.broadcast 'web_notifications_channel', message: ri.to_html
    ri.save
  end

end
