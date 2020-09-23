defmodule TheScoreWeb.RushingView do
  use TheScoreWeb, :view

  def download_link({sorting_direction, sorting_field}, name_filter) do
    link("Download Statistics", to: "/download/rushing_statistics?name_filter=#{name_filter}&direction={sorting_direction}&field=#{sorting_field}", target: "_blank")
  end

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
