use color_eyre::Result;

mod config;
mod scraper;

fn main() -> Result<()> {
    color_eyre::install()?;
    let items = scraper::scrape()?;
    dbg!(items);
    Ok(())
}
