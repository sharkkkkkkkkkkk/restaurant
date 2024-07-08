package Service;

import VO.CarouselChart;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.util.List;

public interface IChartService {
    void addCarouselChart(Part filePart) throws IOException;
    List<CarouselChart> SearchAllCharts();
    void deleteCarouselChart(String name);
}
