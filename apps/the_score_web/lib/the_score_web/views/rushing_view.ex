defmodule TheScoreWeb.RushingView do
  use TheScoreWeb, :view

  @spec draw_sorting_direction(TheScore.Statistics.Rushing.field(), TheScoreWeb.RushingLive.Index.sorting()) :: Phoenix.HTML.safe() 
  def draw_sorting_direction(field, {direction, sorting_field}) do
    
    if field == sorting_field do
      draw_direction_arrow(direction)
    else
    end
  end

  defp draw_direction_arrow(:asc) do
    content_tag(:span, raw("&darr;"), class: "rushing__header-arrow")
  end
  defp draw_direction_arrow(:desc) do
    content_tag(:span, raw("&uarr;"), class: "rushing__header-arrow")
  end
end
